//
//  UMDiameterAvpeDRX_Cycle_Length.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpeDRX_Cycle_Length.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpeDRX_Cycle_Length_Value.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpeDRX_Cycle_Length


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length";
}

- (uint32_t)avpCode
{
    return 1691;
}

+ (uint32_t)avpCode
{
    return 1691;
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
    if(_var_rat_type)
    {
        [arr addObject:_var_rat_type];
    }
    if(_var_edrx_cycle_length_value)
    {
        [arr addObject:_var_edrx_cycle_length_value];
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

