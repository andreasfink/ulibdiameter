//
//  UMDiameterAvpGrouped.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpGrouped



- (NSString *)avpType
{
    return @"Grouped";
}

- (void)afterDecode
{
    _avps = [[UMSynchronizedArray alloc]init];
    NSInteger pos = 0;
    while(_avpData.length >= (pos+8))
    {
        uint8_t avpheader[8];
        memcpy(avpheader,&_avpData.bytes[pos],8);

        NSUInteger avplen = (avpheader[5] << 16)| (avpheader[6] << 8) | (avpheader[7]);
        if(_avpData.length < (pos+avplen))
        {
            @throw([NSException exceptionWithName:@"INVALID_PACKET" reason:@"AVP Group Packets longer than surrounding packet" userInfo:NULL]);
        }
        NSData *subavpdata = [NSData dataWithBytes:&_avpData.bytes[pos] length:avplen];
        UMDiameterAvp *avp = [[UMDiameterAvp alloc]initWithData:subavpdata];
        if(avp)
        {
            [_avps addObject:avp];
        }
        pos += avplen;
    }
}

- (void)beforeEncode
{
    NSMutableData *d = [[NSMutableData alloc]init];

    NSInteger n = _avps.count;
    for(NSInteger i=0;i<n;i++)
    {
        UMDiameterAvp *entry = _avps[i];
        NSData *d2 = [entry packetData];
        [d appendData:d2];
    }
    _avpData = d;
}


@end
