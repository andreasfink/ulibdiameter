//
//  UMDiameterAvpCharging_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[primary-event-charging-function-name]",webName];
        [UMDiameterAvpPrimary_Event_Charging_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[secondary-event-charging-function-name]",webName];
        [UMDiameterAvpSecondary_Event_Charging_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[primary-charging-collection-function-name]",webName];
        [UMDiameterAvpPrimary_Charging_Collection_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[secondary-charging-collection-function-name]",webName];
        [UMDiameterAvpSecondary_Charging_Collection_Function_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

