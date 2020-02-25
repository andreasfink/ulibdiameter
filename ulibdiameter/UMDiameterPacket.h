//
//  UMDiameterPacket.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

#import "UMDiameterCommandFlags.h"
#import "UMDiameterCommandCode.h"

#define DIAMETER_COMMAND_FLAG_REQUEST				0x80
#define DIAMETER_COMMAND_FLAG_PROXIABLE				0x40
#define DIAMETER_COMMAND_FLAG_ERROR					0x20
#define DIAMETER_COMMAND_FLAG_POTENTIAL_RETRANSMIT	0x10
@class UMDiameterAvp;

@interface UMDiameterPacket : UMObject
{
    uint8_t     _version;
    uint8_t     _commandFlags;
    uint32_t    _commandCode;
    uint32_t    _applicationId;
    uint32_t    _hopByHopIdentifier;
    uint32_t    _endToEndIdentifier;
	uint32_t	_messageLength; /* calculated  */
    UMSynchronizedArray *_packet_avps;
    UMSynchronizedArray *_unknown_avps;
}


@property(readwrite,assign,atomic)  uint8_t     version;
@property(readwrite,assign,atomic)  uint8_t     commandFlags;
@property(readwrite,assign,atomic)  uint32_t    commandCode;
@property(readwrite,assign,atomic)  uint32_t    applicationId;
@property(readwrite,assign,atomic)  uint32_t    hopByHopIdentifier;
@property(readwrite,assign,atomic)  uint32_t    endToEndIdentifier;
@property(readwrite,strong,atomic)  UMSynchronizedArray *packet_avps;
@property(readwrite,strong,atomic)  UMSynchronizedArray *unknown_avps;

- (UMDiameterPacket *)init;
- (UMDiameterPacket *)initWithData:(NSData *)packet;
- (UMDiameterPacket *)initWithData:(NSData *)packet atPosition:(NSInteger *)posPtr;
- (UMDiameterPacket *)initWithJsonString:(NSString *)str;
- (UMDiameterPacket *)initWithPacket:(UMDiameterPacket *)packet;

- (void)genericInitialisation;

- (NSData *)packedData;
- (BOOL)flagRequest;
- (BOOL)flagProxyable;
- (BOOL)flagError;
- (BOOL)flagTransmit;
- (void)setFlagRequest:(BOOL)flag;
- (void)setFlagProxyable:(BOOL)flag;
- (void)setFlagError:(BOOL)flag;
- (void)setFlagTransmit:(BOOL)flag;
- (void)appendAvp:(UMDiameterAvp *)avp;
- (UMDiameterAvp *)getAvpByCode:(uint32_t)avpCode;
- (NSArray<UMDiameterAvp *> *)getArrayOfAvpsByCode:(uint32_t)avpCode;

- (void)setAvps:(NSArray<UMDiameterAvp *> *)avp;

- (NSString *)getSessionIdentifier;
- (UMSynchronizedSortedDictionary *)objectValue;
- (void)afterDecode;
- (void)beforeEncode;

- (void)parseJsonString:(NSString *)s error:(NSError **)eptr;

- (void)setDictionaryValueFromWeb:(NSDictionary *)dict;
- (void)setDictionaryValue:(NSDictionary *)dict;
- (UMSynchronizedSortedDictionary *)dictionaryValue;

@end
