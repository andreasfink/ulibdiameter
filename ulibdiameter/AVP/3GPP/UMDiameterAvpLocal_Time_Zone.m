//
//  UMDiameterAvpLocal_Time_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocal_Time_Zone.h"
#import "UMDiameterAvpTime_Zone.h"
#import "UMDiameterAvpDaylight_Saving_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLocal_Time_Zone


- (NSString *)avpType
{
    return @"Local-Time-Zone";
}

- (uint32_t)avpCode
{
    return 1649;
}

+ (uint32_t)avpCode
{
    return 1649;
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
    if(_var_time_zone)
    {
        [arr addObject:_var_time_zone];
    }
    if(_var_daylight_saving_time)
    {
        [arr addObject:_var_daylight_saving_time];
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

