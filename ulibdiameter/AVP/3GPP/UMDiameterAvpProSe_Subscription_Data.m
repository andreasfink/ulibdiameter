//
//  UMDiameterAvpProSe_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProSe_Subscription_Data.h"
#import "UMDiameterAvpProSe_Permission.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpProSe_Subscription_Data


- (NSString *)avpType
{
    return @"ProSe-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 3701;
}

+ (uint32_t)avpCode
{
    return 3701;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_prose_permission.count > 0)
    {
        for(UMDiameterAvpProSe_Permission *o in _var_prose_permission)
        {
            [arr addObject:o];
        }
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

