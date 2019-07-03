//
//  UMDiameterAvpLocation_Information_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpMONTE_Location_Type  avpCode])
        {
            _var_monte_location_type = [[UMDiameterAvpMONTE_Location_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monte_location_type];
        }
        else if(avp.avpCode == [UMDiameterAvpAccuracy avpCode])
        {
            _var_accuracy = [[UMDiameterAvpAccuracy alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_accuracy];
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

