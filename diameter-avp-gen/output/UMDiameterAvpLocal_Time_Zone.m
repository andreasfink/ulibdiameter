//
//  UMDiameterAvpLocal_Time_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_time_zone)
    {
        [arr addObject:_time_zone]
    }
    if(_daylight_saving_time)
    {
        [arr addObject:_daylight_saving_time]
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpTime_Zone  avpCode])
        {
            avp = [[UMDiameterAvpTime_Zone alloc]initWithAvp:avp];
            _time_zone = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpDaylight_Saving_Time avpCode])
        {
            avp = [[UMDiameterAvpDaylight_Saving_Time alloc]initWithAvp:avp];
            _daylight_saving_time = avp;
            [knownAVPs addObject:avp];
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

