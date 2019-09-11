//
//  UMDiameterAvpScheduled_Communication_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpScheduled_Communication_Time.h"
#import "UMDiameterAvpDay_Of_Week_Mask.h"
#import "UMDiameterAvpTime_Of_Day_Start.h"
#import "UMDiameterAvpTime_Of_Day_End.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpScheduled_Communication_Time


- (NSString *)avpType
{
    return @"Scheduled-Communication-Time";
}

- (uint32_t)avpCode
{
    return 3118;
}

+ (uint32_t)avpCode
{
    return 3118;
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
    if(_var_day_of_week_mask.count > 0)
    {
        for(UMDiameterAvpDay_Of_Week_Mask *o in _var_day_of_week_mask)
        {
            [arr addObject:o];
        }
    }
    if(_var_time_of_day_start)
    {
        [arr addObject:_var_time_of_day_start];
    }
    if(_var_time_of_day_end)
    {
        [arr addObject:_var_time_of_day_end];
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

