//
//  UMDiameterAvpLocation_Information_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocation_Information_Configuration.h"
#import "UMDiameterAvpMONTE_Location_Type.h"
#import "UMDiameterAvpAccuracy.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLocation_Information_Configuration


- (NSString *)avpType
{
    return @"Location-Information-Configuration";
}

- (uint32_t)avpCode
{
    return 3135;
}

+ (uint32_t)avpCode
{
    return 3135;
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
    if(_var_monte_location_type)
    {
        [arr addObject:_var_monte_location_type];
    }
    if(_var_accuracy)
    {
        [arr addObject:_var_accuracy];
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

