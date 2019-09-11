//
//  UMDiameterAvpEPS_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_Location_Information.h"
#import "UMDiameterAvpUser_State.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEPS_Location_Information


- (NSString *)avpType
{
    return @"EPS-Location-Information";
}

- (uint32_t)avpCode
{
    return 1496;
}

+ (uint32_t)avpCode
{
    return 1496;
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
    if(_var_user_state)
    {
        [arr addObject:_var_user_state];
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

