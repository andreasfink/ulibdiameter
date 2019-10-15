//
//  UMDiameterAvpSGSN_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_Location_Information.h"
#import "UMDiameterAvpCell_Global_Identity.h"
#import "UMDiameterAvpLocation_Area_Identity.h"
#import "UMDiameterAvpService_Area_Identity.h"
#import "UMDiameterAvpRouting_Area_Identity.h"
#import "UMDiameterAvpGeographical_Information.h"
#import "UMDiameterAvpGeodetic_Information.h"
#import "UMDiameterAvpCurrent_Location_Retrieved.h"
#import "UMDiameterAvpAge_Of_Location_Information.h"
#import "UMDiameterAvpUser_CSG_Information.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSGSN_Location_Information


- (NSString *)avpType
{
    return @"SGSN-Location-Information";
}

- (uint32_t)avpCode
{
    return 1601;
}

+ (uint32_t)avpCode
{
    return 1601;
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
    if(_var_cell_global_identity)
    {
        [_var_cell_global_identity beforeEncode];
        [arr addObject:_var_cell_global_identity];
    }
    if(_var_location_area_identity)
    {
        [_var_location_area_identity beforeEncode];
        [arr addObject:_var_location_area_identity];
    }
    if(_var_service_area_identity)
    {
        [_var_service_area_identity beforeEncode];
        [arr addObject:_var_service_area_identity];
    }
    if(_var_routing_area_identity)
    {
        [_var_routing_area_identity beforeEncode];
        [arr addObject:_var_routing_area_identity];
    }
    if(_var_geographical_information)
    {
        [_var_geographical_information beforeEncode];
        [arr addObject:_var_geographical_information];
    }
    if(_var_geodetic_information)
    {
        [_var_geodetic_information beforeEncode];
        [arr addObject:_var_geodetic_information];
    }
    if(_var_current_location_retrieved)
    {
        [_var_current_location_retrieved beforeEncode];
        [arr addObject:_var_current_location_retrieved];
    }
    if(_var_age_of_location_information)
    {
        [_var_age_of_location_information beforeEncode];
        [arr addObject:_var_age_of_location_information];
    }
    if(_var_user_csg_information)
    {
        [_var_user_csg_information beforeEncode];
        [arr addObject:_var_user_csg_information];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[cell-global-identity]",webName];
        [UMDiameterAvpCell_Global_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[location-area-identity]",webName];
        [UMDiameterAvpLocation_Area_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-area-identity]",webName];
        [UMDiameterAvpService_Area_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[routing-area-identity]",webName];
        [UMDiameterAvpRouting_Area_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[geographical-information]",webName];
        [UMDiameterAvpGeographical_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[geodetic-information]",webName];
        [UMDiameterAvpGeodetic_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[current-location-retrieved]",webName];
        [UMDiameterAvpCurrent_Location_Retrieved appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[age-of-location-information]",webName];
        [UMDiameterAvpAge_Of_Location_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[user-csg-information]",webName];
        [UMDiameterAvpUser_CSG_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Cell-Global-Identity"] = [_var_cell_global_identity objectValue];
	dict[@"Location-Area-Identity"] = [_var_location_area_identity objectValue];
	dict[@"Service-Area-Identity"] = [_var_service_area_identity objectValue];
	dict[@"Routing-Area-Identity"] = [_var_routing_area_identity objectValue];
	dict[@"Geographical-Information"] = [_var_geographical_information objectValue];
	dict[@"Geodetic-Information"] = [_var_geodetic_information objectValue];
	dict[@"Current-Location-Retrieved"] = [_var_current_location_retrieved objectValue];
	dict[@"Age-Of-Location-Information"] = [_var_age_of_location_information objectValue];
	dict[@"User-CSG-Information"] = [_var_user_csg_information objectValue];
	return dict;
}


@end

