//
//  UMDiameterAvpEmergency_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEmergency_Info.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEmergency_Info


- (NSString *)avpType
{
    return @"Emergency-Info";
}

- (uint32_t)avpCode
{
    return 1687;
}

+ (uint32_t)avpCode
{
    return 1687;
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
    if(_var_mip6_agent_info)
    {
        [arr addObject:_var_mip6_agent_info];
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

