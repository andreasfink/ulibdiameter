//
//  UMDiameterAvpSGSN_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
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


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpCell_Global_Identity  avpCode])
        {
            _var_cell_global_identity = [[UMDiameterAvpCell_Global_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_cell_global_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Area_Identity avpCode])
        {
            _var_location_area_identity = [[UMDiameterAvpLocation_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_location_area_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Area_Identity avpCode])
        {
            _var_service_area_identity = [[UMDiameterAvpService_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_area_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpRouting_Area_Identity avpCode])
        {
            _var_routing_area_identity = [[UMDiameterAvpRouting_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_routing_area_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpGeographical_Information avpCode])
        {
            _var_geographical_information = [[UMDiameterAvpGeographical_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_geographical_information];
        }
        else if(avp.avpCode == [UMDiameterAvpGeodetic_Information avpCode])
        {
            _var_geodetic_information = [[UMDiameterAvpGeodetic_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_geodetic_information];
        }
        else if(avp.avpCode == [UMDiameterAvpCurrent_Location_Retrieved avpCode])
        {
            _var_current_location_retrieved = [[UMDiameterAvpCurrent_Location_Retrieved alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_current_location_retrieved];
        }
        else if(avp.avpCode == [UMDiameterAvpAge_Of_Location_Information avpCode])
        {
            _var_age_of_location_information = [[UMDiameterAvpAge_Of_Location_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_age_of_location_information];
        }
        else if(avp.avpCode == [UMDiameterAvpUser_CSG_Information avpCode])
        {
            _var_user_csg_information = [[UMDiameterAvpUser_CSG_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_user_csg_information];
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
    if(unknownAVPs.count>0)
    {
        _var_avp = unknownAVPs;
        [knownAVPs addObject:[_var_avp copy]];
    }
    [self setArray:knownAVPs];
}

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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sgsn-location-information";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCell_Global_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLocation_Area_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Area_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRouting_Area_Identity definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGeographical_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGeodetic_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCurrent_Location_Retrieved definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAge_Of_Location_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_CSG_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

