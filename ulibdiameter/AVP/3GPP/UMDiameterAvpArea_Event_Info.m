//
//  UMDiameterAvpArea_Event_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Event_Info.h"
#import "UMDiameterAvpArea_Definition.h"
#import "UMDiameterAvpOccurrence_Info.h"
#import "UMDiameterAvpInterval_Time.h"
#import "UMDiameterAvpMaximum_Interval.h"
#import "UMDiameterAvpSampling_Interval.h"
#import "UMDiameterAvpReporting_Duration.h"
#import "UMDiameterAvpReporting_Location_Requirements.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpArea_Event_Info


- (NSString *)avpType
{
    return @"Area-Event-Info";
}

- (uint32_t)avpCode
{
    return 2533;
}

+ (uint32_t)avpCode
{
    return 2533;
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
    if(_var_area_definition)
    {
        [arr addObject:_var_area_definition];
    }
    if(_var_occurrence_info)
    {
        [arr addObject:_var_occurrence_info];
    }
    if(_var_interval_time)
    {
        [arr addObject:_var_interval_time];
    }
    if(_var_maximum_interval)
    {
        [arr addObject:_var_maximum_interval];
    }
    if(_var_sampling_interval)
    {
        [arr addObject:_var_sampling_interval];
    }
    if(_var_reporting_duration)
    {
        [arr addObject:_var_reporting_duration];
    }
    if(_var_reporting_location_requirements)
    {
        [arr addObject:_var_reporting_location_requirements];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[area-definition]",webName];
        [UMDiameterAvpArea_Definition appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[occurrence-info]",webName];
        [UMDiameterAvpOccurrence_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[interval-time]",webName];
        [UMDiameterAvpInterval_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[maximum-interval]",webName];
        [UMDiameterAvpMaximum_Interval appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sampling-interval]",webName];
        [UMDiameterAvpSampling_Interval appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-duration]",webName];
        [UMDiameterAvpReporting_Duration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-location-requirements]",webName];
        [UMDiameterAvpReporting_Location_Requirements appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

