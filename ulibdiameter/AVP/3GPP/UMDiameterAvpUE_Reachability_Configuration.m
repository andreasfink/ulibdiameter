//
//  UMDiameterAvpUE_Reachability_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUE_Reachability_Configuration.h"
#import "UMDiameterAvpReachability_Type.h"
#import "UMDiameterAvpMaximum_Response_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUE_Reachability_Configuration


- (NSString *)avpType
{
    return @"UE-Reachability-Configuration";
}

- (uint32_t)avpCode
{
    return 3129;
}

+ (uint32_t)avpCode
{
    return 3129;
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
    if(_var_reachability_type)
    {
        [arr addObject:_var_reachability_type];
    }
    if(_var_maximum_response_time)
    {
        [arr addObject:_var_maximum_response_time];
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

