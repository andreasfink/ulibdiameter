//
//  UMDiameterAvpLocal_Time_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpTime_Zone  avpCode])
        {
            _var_time_zone = [[UMDiameterAvpTime_Zone alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_time_zone];
        }
        else if(avp.avpCode == [UMDiameterAvpDaylight_Saving_Time avpCode])
        {
            _var_daylight_saving_time = [[UMDiameterAvpDaylight_Saving_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_daylight_saving_time];
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

