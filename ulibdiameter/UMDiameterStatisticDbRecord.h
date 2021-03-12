//
//  UMDiameterStatisticDbRecord.h
//  ulibdiameter
//
//  Created by Andreas Fink on 12.03.21.
//  Copyright © 2021 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@interface UMDiameterStatisticDbRecord : UMObject
{
    NSString *_ymdh;
    NSString *_instance;
    NSString *_incomingPeer;
    NSString *_outgoingPeer;
    NSString *_srcHost;
    NSString *_srcRealm;
    NSString *_dstHost;
    NSString *_dstRealm;
    int      _commandCode;
    NSString *_commandName;
    int      _packetCount;
    int      _bytesCount;
    UMMutex  *_lock;
}

@property(readwrite,strong,atomic)  NSString *ymdh;
@property(readwrite,strong,atomic)  NSString *instance;
@property(readwrite,strong,atomic)  NSString *incomingPeer;
@property(readwrite,strong,atomic)  NSString *outgoingPeer;
@property(readwrite,strong,atomic)  NSString *srcHost;
@property(readwrite,strong,atomic)  NSString *srcRealm;
@property(readwrite,strong,atomic)  NSString *dstHost;
@property(readwrite,strong,atomic)  NSString *dstRealm;
@property(readwrite,assign,atomic)  int     commandCode;
@property(readwrite,strong,atomic)  NSString *commandName;
@property(readwrite,assign,atomic)  int     packetCount;
@property(readwrite,assign,atomic)  int     bytesCount;


- (NSString *)keystring;
+ (NSString *)keystringFor:(NSString *)ymdh
              incomingPeer:(NSString *)incomingPeer
              outgoingPeer:(NSString *)outgoingPeer
                   srcHost:(NSString *)incomingPeer
                   srcRealm:(NSString *)outgoingPeer
                   dstHost:(NSString *)dstHost
                  dstRealm:(NSString *)dstRealm
               commandCode:(int)commandCode
                  instance:(NSString *)instance;

- (void)increasePacketCount:(int)msuCount
                  byteCount:(int)byteCount;
- (void)flushToPool:(UMDbPool *)pool table:(UMDbTable *)table;


@end
