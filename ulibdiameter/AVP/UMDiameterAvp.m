//
//  UMDiameterAvp.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFlags.h"

@implementation UMDiameterAvp

- (NSString *)avpType
{
    return @"undefined";
}

- (NSString *)avpName
{
    return umdiameter_avp_code_string (self.avpCode);
}

- (UMDiameterAvp *)initWithData:(NSData *)data
{
    if(data.length < 8)
    {
        return NULL;
    }
    const uint8_t *header = data.bytes;
    NSUInteger avlen = (header[5] << 16)| (header[6] << 8) | (header[7]);
    if(avlen > data.length)
    {
        return NULL;
    }
    
    self = [super init];
    if(self)
    {
        _avpCode = (header[0] << 24) | (header[1] << 16) | (header[2] << 8) | (header[3] << 0);
        _avpFlags = header[4];
        if(_avpFlags & UMDiameterAvpFlag_Vendor)
        {
            if(avlen < 12)
            {
                return NULL;
            }
            if(avlen != data.length)
                _avpVendorId = (header[8] << 24) | (header[9] << 16) | (header[10] << 8) | (header[11] << 0);
            _avpData = [NSData dataWithBytes:&header[12]  length:(avlen-12)];
        }
        else
        {
            _avpData = [NSData dataWithBytes:&header[8]  length:(avlen-8)];
        }
        [self afterDecode];
    }
    return self;
}

- (uint32_t)packetLength
{
    uint32_t dlen = (uint32_t)_avpData.length;
    switch(dlen % 4)
    {
        case 1:
            dlen =  dlen+3;
            break;
        case 2:
            dlen =  dlen+2;
            break;
        case 3:
            dlen =  dlen+1;
            break;
    }
    dlen = dlen + 8; /* code & length */
    if(_avpFlags & UMDiameterAvpFlag_Vendor )
    {
        dlen += 4;
    }
    return dlen;
}

- (uint32_t )dataLength
{
    return (uint32_t)_avpData.length;
}

- (NSData *)packetData
{
    [self beforeEncode];

    uint8_t header[12];
    uint32_t headerlen;
    uint32_t dlen = (uint32_t)_avpData.length;

    uint32_t code = self.avpCode;
    header[0] = code & 0xFF000000 >> 24;
    header[1] = code & 0x00FF0000 >> 16;
    header[2] = code & 0x0000FF00 >> 8;
    header[3] = code & 0x000000FF >> 0;

    uint8_t flags = self.avpFlags;

    header[4] = flags & 0xFF;
    header[5] = dlen & 0x00FF0000 >> 16;
    header[6] = dlen & 0x0000FF00 >> 8;
    header[7] = dlen & 0x000000FF >> 0;
    
    if(_avpFlags & UMDiameterAvpFlag_Vendor )
    {
        headerlen = 12;
        header[8] = _avpVendorId & 0xFF000000 >> 24;
        header[9] = _avpVendorId & 0x00FF0000 >> 16;
        header[10] = _avpVendorId & 0x0000FF00 >> 8;
        header[11] = _avpVendorId & 0x000000FF >> 0;
    }
    else
    {
        headerlen = 8;
    }
    NSMutableData *d = [[NSMutableData alloc]initWithBytes:header length:headerlen];
    
    if(dlen > 0)
    {
        [d appendData:_avpData];
        /* append padding bytes */
        switch(dlen % 4)
        {
            case 1:
                [d appendBytes:"\0\0\0" length:3];
                break;
            case 2:
                [d appendBytes:"\0\0" length:2];
                break;
            case 3:
                [d appendBytes:"\0" length:1];
                break;
        }
    }
    return d;
}

- (BOOL)flagVendor
{
    if(_avpFlags & UMDiameterAvpFlag_Vendor )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagProtected
{
    if(_avpFlags & UMDiameterAvpFlag_Protected )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagMandatory
{
    if(_avpFlags & UMDiameterAvpFlag_Mandatory )
    {
        return YES;
    }
    return NO;
}



- (void)setFlagVendor:(BOOL)flag
{
    if(flag)
    {
        _avpFlags |=  UMDiameterAvpFlag_Vendor;
    }
    else
    {
        _avpFlags &= ~UMDiameterAvpFlag_Vendor;
    }
}

- (void)setFlagProtected:(BOOL)flag
{
    if(flag)
    {
        _avpFlags |=  UMDiameterAvpFlag_Protected;
    }
    else
    {
        _avpFlags &= ~UMDiameterAvpFlag_Protected;
    }
}

- (void)setFlagMandatory:(BOOL)flag
{
    if(flag)
    {
        _avpFlags |=  UMDiameterAvpFlag_Mandatory;
    }
    else
    {
        _avpFlags &= ~UMDiameterAvpFlag_Mandatory;
    }
}

- (void)afterDecode
{
    /* to be overriden by subclasses */
}

- (void)beforeEncode
{
    /* to be overriden by subclasses */
}
@end

