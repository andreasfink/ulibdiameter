//
//  UMDiameterStatisticDb.m
//  ulibdiameter
//
//  Created by Andreas Fink on 12.03.21.
//  Copyright © 2021 Andreas Fink. All rights reserved.
//

#import "UMDiameterStatisticDb.h"
#import "UMDiameterStatisticDbRecord.h"
#import "UMDiameterRouter.h"

@implementation UMDiameterStatisticDb



#define MAX_YMDH_LEN            (4+2+2+2)
#define MAX_INSTANCE_LEN        32
#define MAX_PEER_LEN            32
#define MAX_HOST_LEN            64
#define MAX_REALM_LEN           64
#define MAX_COMMAND_INT_LEN     10
#define MAX_COMMAND_NAME_LEN    16

#define  MAX_DBKEY_LEN ( MAX_YMDH_LEN\
            + 1 + MAX_INSTANCE_LEN\
            + 1 + MAX_PEER_LEN \
            + 1 + MAX_PEER_LEN \
            + 1 + MAX_HOST_LEN \
            + 1 + MAX_REALM_LEN \
            + 1 + MAX_HOST_LEN \
            + 1 + MAX_REALM_LEN \
            + 1 + MAX_COMMAND_INT_LEN )

static dbFieldDef UMDiameterStatisticDb_fields[] =
{
    {"dbkey",               NULL,       NO,     DB_PRIMARY_INDEX,   DB_FIELD_TYPE_VARCHAR,             MAX_DBKEY_LEN,        0,NULL,NULL,1},
    {"ymdh",                NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_YMDH_LEN,         0,NULL,NULL,2},
    {"instance",            NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_INSTANCE_LEN,     0,NULL,NULL,3},
    {"incoming_peer",       NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_PEER_LEN,         0,NULL,NULL,4},
    {"outgoing_peer",       NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_PEER_LEN,         0,NULL,NULL,5},
    {"src_host",            NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_HOST_LEN,         0,NULL,NULL,6},
    {"src_realm",           NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_REALM_LEN,        0,NULL,NULL,7},
    {"dst_host",            NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_HOST_LEN,         0,NULL,NULL,8},
    {"dst_realm",           NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_REALM_LEN,        0,NULL,NULL,9},
    {"command_code",        NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_INTEGER,             0,                    0,NULL,NULL,10},
    {"command_name",        NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_VARCHAR,             MAX_COMMAND_NAME_LEN, 0,NULL,NULL,11},
    {"packet_count",        NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_INTEGER,             0,                    0,NULL,NULL,12},
    {"bytes_count",         NULL,       NO,     DB_INDEXED,         DB_FIELD_TYPE_INTEGER,             0,                    0,NULL,NULL,13},
    { "",                   NULL,       NO,     DB_NOT_INDEXED,     DB_FIELD_TYPE_END,                 0,                    0,NULL,NULL,0},
};

- (UMDiameterStatisticDb *)initWithPoolName:(NSString *)poolName
                              tableName:(NSString *)table
                             appContext:(id<UMDiameterRouterAppDelegateProtocol>)appContext
                             autocreate:(BOOL)autocreate
                               instance:(NSString *)instance
{
    @autoreleasepool
    {
        self = [super init];
        if(self)
        {
            NSDictionary *config =@{   @"enable"     : @(YES),
                                       @"table-name" : table,
                                       @"autocreate" : @(autocreate),
                                       @"pool-name"  : poolName };
            _poolName = poolName;
            _pool = [appContext dbPools][_poolName];
            _table = [[UMDbTable alloc]initWithConfig:config andPools:[appContext dbPools]];
            _lock = [[UMMutex alloc]initWithName:@"UMMTP3StatisticDb-lock"];
            _entries = [[UMSynchronizedDictionary alloc]init];
            _instance = instance;
            
            NSTimeZone *tz = [NSTimeZone timeZoneWithName:@"UTC"];
            _ymdhDateFormatter= [[NSDateFormatter alloc]init];
            NSLocale *ukLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_GB"];
            [_ymdhDateFormatter setLocale:ukLocale];
            [_ymdhDateFormatter setDateFormat:@"yyyyMMddHH"];
            [_ymdhDateFormatter setTimeZone:tz];
        }
        return self;
    }
}

- (void)doAutocreate
{
    if(_pool==NULL)
    {
        _pool = _table.pools[_poolName];
    }
    UMDbSession *session = [_pool grabSession:__FILE__ line:__LINE__ func:__func__];
    [_table autoCreate:UMDiameterStatisticDb_fields session:session];
    [_pool returnSession:session file:__FILE__ line:__LINE__ func:__func__];
}

- (void)addByteCount:(int)byteCount
        incomingPeer:(NSString *)incomingPeer
        outgoingPeer:(NSString *)outgoingPeer
             srcHost:(NSString *)srcHost
            srcRealm:(NSString *)srcRealm
             dstHost:(NSString *)dstHost
            dstRealm:(NSString *)dstRealm
         commandCode:(int)commandCode
         commandName:(NSString *)commandName
{
    
    
#if defined(UMDIAMETER_STATISTICS_DEBUG)
    NSLog(@"UMDIAMETER_STATISTICS_DEBUG: addByteCount:%d\n"
          @"                             incomingPeer:%@\n"
          @"                             outgoingPeer:%@\n"
          @"                                  srcHost:%@\n"
          @"                                 srcRealm:%@\n"
          @"                                  dstHost:%@\n"
          @"                                 dstRealm:%@\n"
          @"                              commandCode:%d\n"
          @"                              commandName:%@\n"
          ,byteCount,incomingPeer,outgoingPeer,srcHost,srcRealm,dstHost,dstRealm,commandCode,commandName);
#endif
    
#define STRING_LIMIT(x,l)  (  (x.length == 0) ? @"" : (x.length > l ? [x substringToIndex:l] : x))
    
    @autoreleasepool
    {
        NSDate *d = [NSDate date];
        NSString *ymdh = [_ymdhDateFormatter stringFromDate:d];
        

        STRING_LIMIT(incomingPeer,MAX_PEER_LEN);
        STRING_LIMIT(outgoingPeer,MAX_PEER_LEN);
        STRING_LIMIT(srcHost,MAX_HOST_LEN);
        STRING_LIMIT(srcRealm,MAX_REALM_LEN);
        STRING_LIMIT(dstHost,MAX_HOST_LEN);
        STRING_LIMIT(dstRealm,MAX_REALM_LEN);
        STRING_LIMIT(commandName,MAX_COMMAND_NAME_LEN);
        NSString *key = [UMDiameterStatisticDbRecord keystringFor:ymdh
                                                     incomingPeer:incomingPeer
                                                     outgoingPeer:outgoingPeer
                                                          srcHost:srcHost
                                                         srcRealm:srcRealm
                                                          dstHost:dstHost dstRealm:dstRealm
                                                      commandCode:commandCode
                                                         instance:_instance];
        [_lock lock];
        UMDiameterStatisticDbRecord *rec = _entries[key];
        if(rec == NULL)
        {
            rec = [[UMDiameterStatisticDbRecord alloc]init];
            rec.ymdh = ymdh;
            rec.incomingPeer = incomingPeer;
            rec.incomingPeer = outgoingPeer;
            rec.srcHost = srcHost;
            rec.srcRealm = srcRealm;
            rec.dstHost = dstHost;
            rec.dstRealm = dstRealm;
            rec.commandCode = commandCode;
            rec.instance = _instance;
            _entries[key] = rec;
        }
        [_lock unlock];
        [rec increasePacketCount:1 byteCount:byteCount];
    }
}

- (void)flush
{
    @autoreleasepool
    {
        [_lock lock];
        UMSynchronizedDictionary *tmp = _entries;
        _entries = [[UMSynchronizedDictionary alloc]init];
        [_lock unlock];
        
        NSArray *keys = [tmp allKeys];
        for(NSString *key in keys)
        {
            UMDiameterStatisticDbRecord *rec = tmp[key];
            [rec flushToPool:_pool table:_table];
        }
    }
}
@end
