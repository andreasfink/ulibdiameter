//
//  UMDiameterStatisticDb.h
//  ulibdiameter
//
//  Created by Andreas Fink on 12.03.21.
//  Copyright © 2021 Andreas Fink. All rights reserved.
//

#import "UMDiameterRouter.h"
#import <ulib/ulib.h>
#import <ulibdb/ulibdb.h>

@interface UMDiameterStatisticDb : UMObject
{
    UMDbPool *_pool;
    UMDbTable *_table;
    UMMutex *_lock;
    UMSynchronizedDictionary *_entries;
    NSDateFormatter *_ymdhDateFormatter;
    NSString *_instance;
    NSString *_poolName;
}

- (UMDiameterStatisticDb *)initWithPoolName:(NSString *)pool
                              tableName:(NSString *)table
                             appContext:(id<UMDiameterRouterAppDelegateProtocol>)appContext
                             autocreate:(BOOL)autocreate
                               instance:(NSString *)instance;

- (void)addByteCount:(int)byteCount
        incomingPeer:(NSString *)incomingLinkset
        outgoingPeer:(NSString *)outgoingLinkset
             srcHost:(NSString *)srcHost
            srcRealm:(NSString *)srcRealm
             dstHost:(NSString *)dstHost
            dstRealm:(NSString *)dstRealm
         commandCode:(int)commandCode
         commandName:(NSString *)commandName;
- (void)doAutocreate;
- (void)flush;

@end

