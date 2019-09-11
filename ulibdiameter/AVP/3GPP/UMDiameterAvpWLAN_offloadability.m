//
//  UMDiameterAvpWLAN_offloadability.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWLAN_offloadability.h"
#import "UMDiameterAvpWLAN_offloadability_EUTRAN.h"
#import "UMDiameterAvpWLAN_offloadability_UTRAN.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpWLAN_offloadability


- (NSString *)avpType
{
    return @"WLAN-offloadability";
}

- (uint32_t)avpCode
{
    return 1667;
}

+ (uint32_t)avpCode
{
    return 1667;
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
    if(_var_wlan_offloadability_eutran)
    {
        [arr addObject:_var_wlan_offloadability_eutran];
    }
    if(_var_wlan_offloadability_utran)
    {
        [arr addObject:_var_wlan_offloadability_utran];
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

