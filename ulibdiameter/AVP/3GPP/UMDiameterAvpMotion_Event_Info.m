//
//  UMDiameterAvpMotion_Event_Info.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMotion_Event_Info.h"
#import "UMDiameterAvpLinear_Distance.h"
#import "UMDiameterAvpOccurrence_Info.h"
#import "UMDiameterAvpInterval_Time.h"
#import "UMDiameterAvpMaximum_Interval.h"
#import "UMDiameterAvpSampling_Interval.h"
#import "UMDiameterAvpReporting_Duration.h"
#import "UMDiameterAvpReporting_Location_Requirements.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMotion_Event_Info


- (NSString *)avpType
{
    return @"Motion-Event-Info";
}

- (uint32_t)avpCode
{
    return 2559;
}

+ (uint32_t)avpCode
{
    return 2559;
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
    if(_var_linear_distance)
    {
        [_var_linear_distance beforeEncode];
        [arr addObject:_var_linear_distance];
    }
    if(_var_occurrence_info)
    {
        [_var_occurrence_info beforeEncode];
        [arr addObject:_var_occurrence_info];
    }
    if(_var_interval_time)
    {
        [_var_interval_time beforeEncode];
        [arr addObject:_var_interval_time];
    }
    if(_var_maximum_interval)
    {
        [_var_maximum_interval beforeEncode];
        [arr addObject:_var_maximum_interval];
    }
    if(_var_sampling_interval)
    {
        [_var_sampling_interval beforeEncode];
        [arr addObject:_var_sampling_interval];
    }
    if(_var_reporting_duration)
    {
        [_var_reporting_duration beforeEncode];
        [arr addObject:_var_reporting_duration];
    }
    if(_var_reporting_location_requirements)
    {
        [_var_reporting_location_requirements beforeEncode];
        [arr addObject:_var_reporting_location_requirements];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[linear-distance]",webName];
        [UMDiameterAvpLinear_Distance appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
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

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Linear-Distance"] = [_var_linear_distance objectValue];
	dict[@"Occurrence-Info"] = [_var_occurrence_info objectValue];
	dict[@"Interval-Time"] = [_var_interval_time objectValue];
	dict[@"Maximum-Interval"] = [_var_maximum_interval objectValue];
	dict[@"Sampling-Interval"] = [_var_sampling_interval objectValue];
	dict[@"Reporting-Duration"] = [_var_reporting_duration objectValue];
	dict[@"Reporting-Location-Requirements"] = [_var_reporting_location_requirements objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"motion-event-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLinear_Distance definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOccurrence_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpInterval_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMaximum_Interval definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSampling_Interval definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReporting_Duration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReporting_Location_Requirements definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

