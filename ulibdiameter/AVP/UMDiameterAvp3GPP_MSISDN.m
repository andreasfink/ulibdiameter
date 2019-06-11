//
//  UMDiameterAvpMSISDN.m
//  ulibdiameter
//
//  Created by Andreas Fink on 04.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_MSISDN.h"

@implementation UMDiameterAvp3GPP_MSISDN



- (NSString *)avpType
{
    return @"MSISDN";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_MSISDN;
}

-(void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = UMDiameterApplicationId_3GPP;
}



- (void)setValue:(NSString *)digits
{
    digits = [digits onlyHex];
    NSInteger n = digits.length;
    NSMutableString *o = [[NSMutableString alloc]init];
    for(NSInteger i=0;i<n;i+=2)
    {
        unichar c1 = [digits characterAtIndex:i];
        unichar c2;
        if((i+1)<n)
        {
             c2 = [digits characterAtIndex:i+1];
        }
        else
        {
            c2 = 'F';
        }
        [o appendFormat:@"%c%c",c2,c1];
    }
    _avpData = [o unhexedData];
}

- (NSString *)value
{
    NSMutableString *out = [[NSMutableString alloc]init];
    NSInteger n = _avpData.length;
    const uint8_t *bytes = [_avpData bytes];
    for(NSInteger i=0;i<n;i++)
    {
        unsigned char a = bytes[i] & 0xF;
        unsigned char b = (bytes[i]>>4) & 0xF;
        if(a<10)
        {
            [out appendFormat:@"%c",(a+'0')];
        }
        else
        {
            [out appendFormat:@"%c",(a-10+'A')];
        }

        if(b<10)
        {
            [out appendFormat:@"%c",(b+'0')];
        }
        else
        {
            if((b !=15) && (i != (n-1))) /* not filler */
            {
                [out appendFormat:@"%c",(b-10+'A')];
            }
        }
    }
    return out;
}

- (UMSynchronizedSortedDictionary *)objectValue
{
    UMSynchronizedSortedDictionary *dict = [super objectValue];
    dict[@"msisdn"] = [self value];
    return dict;
}

@end
