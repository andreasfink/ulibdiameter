//
//  UMDiameterAvpCall_Barring_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCall_Barring_Info.h"
#import "UMDiameterAvpSS_Code.h"
#import "UMDiameterAvpSS_Status.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpCall_Barring_Info


- (NSString *)avpType
{
    return @"Call-Barring-Info";
}

- (uint32_t)avpCode
{
    return 1488;
}

+ (uint32_t)avpCode
{
    return 1488;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_ss_code)
    {
        [arr addObject:_var_ss_code];
    }
    if(_var_ss_status)
    {
        [arr addObject:_var_ss_status];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

