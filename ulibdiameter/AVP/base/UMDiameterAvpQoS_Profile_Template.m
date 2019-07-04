//
//  UMDiameterAvpQoS_Profile_Template.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:39:39.689000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Profile_Template.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpQoS_Profile_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpQoS_Profile_Template


- (NSString *)avpType
{
    return @"QoS-Profile-Template";
}

- (uint32_t)avpCode
{
    return 574;
}

+ (uint32_t)avpCode
{
    return 574;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_vendor_id)
    {
        [arr addObject:_var_vendor_id];
    }
    if(_var_qos_profile_id)
    {
        [arr addObject:_var_qos_profile_id];
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

