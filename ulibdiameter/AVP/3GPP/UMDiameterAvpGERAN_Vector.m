//
//  UMDiameterAvpGERAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGERAN_Vector.h"
#import "UMDiameterAvpItem_Number.h"
#import "UMDiameterAvpRAND.h"
#import "UMDiameterAvpSRES.h"
#import "UMDiameterAvpKc.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpGERAN_Vector


- (NSString *)avpType
{
    return @"GERAN-Vector";
}

- (uint32_t)avpCode
{
    return 1416;
}

+ (uint32_t)avpCode
{
    return 1416;
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
    if(_var_item_number)
    {
        [arr addObject:_var_item_number];
    }
    if(_var_rand)
    {
        [arr addObject:_var_rand];
    }
    if(_var_sres)
    {
        [arr addObject:_var_sres];
    }
    if(_var_kc)
    {
        [arr addObject:_var_kc];
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

