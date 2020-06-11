//
//  UMDiameterAvp.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import "UMDiameterAvpCodes.h"
#import "UMDiameterAvpFlags.h"
#import "UMDiameterVendorId.h"

@interface UMDiameterAvp : UMObject
{
    uint32_t    _avpCode;
    uint8_t     _avpFlags;
    uint32_t    _avpVendorId;
    uint32_t    _avpLength;
    NSData      *_avpData;
}

- (NSString *)avpType;

- (void)genericInitialisation;
- (UMDiameterAvp *)init;
- (UMDiameterAvp *)initWithData:(NSData *)data;
- (UMDiameterAvp *)initWithData:(NSData *)data
                        avpCode:(uint32_t)avpCode
                      avpVendor:(uint32_t)avpVendor;

- (UMDiameterAvp *)initWithAvp:(UMDiameterAvp *)avp;
- (UMDiameterAvp *)initWithJsonString:(NSString *)json;
- (BOOL)parseJsonString:(NSString *)string error:(NSError **)err;

- (uint32_t)packetLength;   /* length inclusive padding inclusive header length */
- (NSData *)packetData;     /* data inclusive padding */

- (uint32_t)dataLength;     /* length exclusive padding exclusive header length */


- (UMDiameterAvp *)initWithString:(NSString *)str;
- (UMDiameterAvp *)initWithObject:(id)obj;

/* to set an object from Json */
- (void)setObjectValue:(id)obj;
- (id)objectValue;

- (void)setStringValue:(NSString *)string;
- (void)setDataValue:(NSData *)data;
- (void)setNumberValue:(NSNumber *)number;
- (void)setDictionaryValue:(NSDictionary *)dict;
- (void)setDateValue:(NSDate *)date;

@property(readwrite,assign,atomic)  uint32_t    avpCode;
@property(readwrite,assign,atomic)  uint8_t     avpFlags;
@property(readwrite,assign,atomic)  uint32_t    avpVendorId;
@property(readwrite,strong,atomic)  NSData      *avpData;

- (BOOL)flagVendor;
- (BOOL)flagProtected;
- (BOOL)flagMandatory;

- (void)setFlagVendor:(BOOL)flag;
- (void)setFlagProtected:(BOOL)flag;
- (void)setFlagMandatory:(BOOL)flag;

- (void)afterDecode;
- (void)beforeEncode;
+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass;
+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass value:(NSString *)value;
- (UMSynchronizedSortedDictionary *)definition;

@end
