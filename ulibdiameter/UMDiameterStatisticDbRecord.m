//
//  UMDiameterStatisticDbRecord.m
//  ulibdiameter
//
//  Created by Andreas Fink on 12.03.21.
//  Copyright © 2021 Andreas Fink. All rights reserved.
//

#import <ulibdb/ulibdb.h>

#import "UMDiameterStatisticDbRecord.h"

@implementation UMDiameterStatisticDbRecord


- (UMDiameterStatisticDbRecord *)init
{
    self = [super init];
    if(self)
    {
        _lock = [[UMMutex alloc]initWithName:@"UMDiameterStatisticDbRecord-lock"];
    }
    return self;
}


- (NSString *)keystring
{
    return [NSString stringWithFormat:@"%@:%@:%@:%@:%@:%@:%@:%d:%@",
            _ymdh,
            _incomingPeer,
            _outgoingPeer,
            _srcHost,
            _srcRealm,
            _dstHost,
            _dstRealm,
            _commandCode,
            _instance];
}

+ (NSString *)keystringFor:(NSString *)ymdh
              incomingPeer:(NSString *)incomingPeer
              outgoingPeer:(NSString *)outgoingPeer
                   srcHost:(NSString *)srcHost
                  srcRealm:(NSString *)srcRealm
                   dstHost:(NSString *)dstHost
                  dstRealm:(NSString *)dstRealm
               commandCode:(int)commandCode
                  instance:(NSString *)instance
{
    return [NSString stringWithFormat:@"%@:%@:%@:%@:%@:%@:%@:%d:%@",
            ymdh,
            incomingPeer,
            outgoingPeer,
            srcHost,
            srcRealm,
            dstHost,
            dstRealm,
            commandCode,
            instance];
}

- (BOOL)insertIntoDb:(UMDbPool *)pool table:(UMDbTable *)dbt /* returns YES on success */
{
    BOOL success = NO;
    @autoreleasepool
    {
        @try
        {
            [_lock lock];
            UMDbQuery *query = [UMDbQuery queryForFile:__FILE__ line: __LINE__];
            if(!query.isInCache)
            {
                NSArray *fields = @[
                                    @"dbkey",
                                    @"ymdh",
                                    @"instance",
                                    @"incoming_peer",
                                    @"outgoing_peer",
                                    @"src_host",
                                    @"src_realm",
                                    @"dst_host",
                                    @"dst_realm",
                                    @"command_code",
                                    @"command_name",
                                    @"packet_count",
                                    @"bytes_count"];
                [query setType:UMDBQUERYTYPE_INSERT];
                [query setTable:dbt];
                [query setFields:fields];
                [query addToCache];
            }
            NSString *key = [self keystring];
            NSArray *params  = [NSArray arrayWithObjects:
                                STRING_NONEMPTY(key),
                                STRING_NONEMPTY(_ymdh),
                                STRING_NONEMPTY(_instance),
                                STRING_NONEMPTY(_incomingPeer),
                                STRING_NONEMPTY(_outgoingPeer),
                                STRING_NONEMPTY(_srcHost),
                                STRING_NONEMPTY(_srcRealm),
                                STRING_NONEMPTY(_dstHost),
                                STRING_NONEMPTY(_dstRealm),
                                STRING_FROM_INT(_commandCode),
                                STRING_NONEMPTY(_commandName),
                                STRING_FROM_INT(_packetCount),
                                STRING_FROM_INT(_bytesCount),
                                NULL];
            UMDbSession *session = [pool grabSession:FLF];
            unsigned long long affectedRows = 0;
            success = [session cachedQueryWithNoResult:query parameters:params allowFail:YES primaryKeyValue:NULL affectedRows:&affectedRows];
            [pool returnSession:session file:FLF];
        }
        @catch (NSException *e)
        {
            NSLog(@"Exception: %@",e);
        }
        @finally
        {
            [_lock unlock];
        }
    }
    return success;
}

- (BOOL)updateDb:(UMDbPool *)pool table:(UMDbTable *)dbt /* returns YES on success */
{
    BOOL success = NO;
    @autoreleasepool
    {
        @try
        {
            [_lock lock];
            
            UMDbQuery *query = [UMDbQuery queryForFile:__FILE__ line: __LINE__];
            if(!query.isInCache)
            {
                [query setType:UMDBQUERYTYPE_INCREASE_BY_KEY];
                [query setTable:dbt];
                [query setFields:@[@"packet_count",@"bytes_count"]];
                [query setPrimaryKeyName:@"dbkey"];
                [query addToCache];
            }
            NSArray *params = [NSArray arrayWithObjects:
                                [NSNumber numberWithInt:_packetCount],
                                [NSNumber numberWithInt:_bytesCount],
                                 NULL];
            NSString *key = [self keystring];
            UMDbSession *session = [pool grabSession:__FILE__ line:__LINE__ func:__func__];
            unsigned long long rowCount;
            success = [session cachedQueryWithNoResult:query
                                            parameters:params
                                             allowFail:YES
                                       primaryKeyValue:key
                                          affectedRows:&rowCount];
            if(rowCount==0)
            {
                success = NO;
            }
            [pool returnSession:session file:__FILE__ line:__LINE__ func:__func__];
        }
        @catch (NSException *e)
        {
            NSLog(@"Exception: %@",e);
        }
        @finally
        {
            [_lock unlock];
        }
    }
    return success;
}

- (void)increasePacketCount:(int)packetCount
                  byteCount:(int)byteCount
{
    [_lock lock];
    _packetCount += packetCount;
    _bytesCount += byteCount;
    [_lock unlock];
}

- (void)flushToPool:(UMDbPool *)pool table:(UMDbTable *)table
{
    [_lock lock];
    if([self updateDb:pool table:table] == NO)
    {
        if([self insertIntoDb:pool table:table])
        {
            _packetCount = 0;
            _bytesCount = 0;
        }
    }
    [_lock unlock];
}

@end

