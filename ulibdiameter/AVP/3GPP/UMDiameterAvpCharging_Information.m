//
//  UMDiameterAvpCharging_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:29:38.359000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCharging_Information.h"
#import "UMDiameterAvpPrimary_Event_Charging_Function_Name.h"
#import "UMDiameterAvpSecondary_Event_Charging_Function_Name.h"
#import "UMDiameterAvpPrimary_Charging_Collection_Function_Name.h"
#import "UMDiameterAvpSecondary_Charging_Collection_Function_Name.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpCharging_Information


- (NSString *)avpType
{
    return @"Charging-Information";
}

- (uint32_t)avpCode
{
    return 618;
}

+ (uint32_t)avpCode
{
    return 618;
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
    if(_var_primary_event_charging_function_name)
    {
        [arr addObject:_var_primary_event_charging_function_name];
    }
    if(_var_secondary_event_charging_function_name)
    {
        [arr addObject:_var_secondary_event_charging_function_name];
    }
    if(_var_primary_charging_collection_function_name)
    {
        [arr addObject:_var_primary_charging_collection_function_name];
    }
    if(_var_secondary_charging_collection_function_name)
    {
        [arr addObject:_var_secondary_charging_collection_function_name];
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
        if(avp.avpCode == [UMDiameterAvpPrimary_Event_Charging_Function_Name  avpCode])
        {
            _var_primary_event_charging_function_name = [[UMDiameterAvpPrimary_Event_Charging_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_primary_event_charging_function_name];
        }
        else if(avp.avpCode == [UMDiameterAvpSecondary_Event_Charging_Function_Name avpCode])
        {
            _var_secondary_event_charging_function_name = [[UMDiameterAvpSecondary_Event_Charging_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_secondary_event_charging_function_name];
        }
        else if(avp.avpCode == [UMDiameterAvpPrimary_Charging_Collection_Function_Name avpCode])
        {
            _var_primary_charging_collection_function_name = [[UMDiameterAvpPrimary_Charging_Collection_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_primary_charging_collection_function_name];
        }
        else if(avp.avpCode == [UMDiameterAvpSecondary_Charging_Collection_Function_Name avpCode])
        {
            _var_secondary_charging_collection_function_name = [[UMDiameterAvpSecondary_Charging_Collection_Function_Name alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_secondary_charging_collection_function_name];
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

