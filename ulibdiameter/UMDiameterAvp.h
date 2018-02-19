//
//  UMDiameterAvp.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@interface UMDiameterAvp : UMObject
{
    uint32_t    _avpCode;
    uint8_t     _avpFlags;
    uint32_t    _avpVendorId;
    NSData      *_avpData;
}


- (UMDiameterAvp *)initWithData:(NSData *)data;

- (uint32_t)packetLength;   /* length inclusive padding inclusive header length */
- (NSData *)packetData;     /* data inclusive padding */

- (uint32_t)dataLength;     /* length exclusive padding exclusive header length */


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

@end
