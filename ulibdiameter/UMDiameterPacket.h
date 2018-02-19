//
//  UMDiameterPacket.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

#define DIAMETER_COMMAND_FLAG_REQUEST
#define DIAMETER_COMMAND_FLAG_PROXIABLE
#define DIAMETER_COMMAND_FLAG_ERROR
#define DIAMETER_COMMAND_FLAG_POTENTIAL_RETRANSMIT

@interface UMDiameterPacket : UMObject
{
    uint8_t     _version;
    uint8_t     _commandFlags;
    uint32_t    _commandCode;
    uint32_t    _applicationId;
    uint32_t    _hopByHopIdentifier;
    uint32_t    _endToEndIdentifier;
    UMSynchronizedArray *_avps;
}

- (UMDiameterPacket *)init;
- (UMDiameterPacket *)initWithData:(NSData *)packet;
- (UMDiameterPacket *)initWithData:(NSData *)packet atPosition:(NSInteger *)posPtr;

- (NSData *)packedData;
- (BOOL)flagRequest;
- (BOOL)flagProxyable;
- (BOOL)flagError;
- (BOOL)flagTransmit;
- (void)setFlagRequest:(BOOL)flag;
- (void)setFlagProxyable:(BOOL)flag;
- (void)setFlagError:(BOOL)flag;
- (void)setFlagTransmit:(BOOL)flag;

@end
