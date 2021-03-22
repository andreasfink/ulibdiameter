//
//  UMDiameterAvpArea_Event_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
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
        [_var_area_definition beforeEncode];
        [arr addObject:_var_area_definition];
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


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpArea_Definition  avpCode])
        {
            _var_area_definition = [[UMDiameterAvpArea_Definition alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_area_definition];
        }
        else if(avp.avpCode == [UMDiameterAvpOccurrence_Info avpCode])
        {
            _var_occurrence_info = [[UMDiameterAvpOccurrence_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_occurrence_info];
        }
        else if(avp.avpCode == [UMDiameterAvpInterval_Time avpCode])
        {
            _var_interval_time = [[UMDiameterAvpInterval_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_interval_time];
        }
        else if(avp.avpCode == [UMDiameterAvpMaximum_Interval avpCode])
        {
            _var_maximum_interval = [[UMDiameterAvpMaximum_Interval alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_maximum_interval];
        }
        else if(avp.avpCode == [UMDiameterAvpSampling_Interval avpCode])
        {
            _var_sampling_interval = [[UMDiameterAvpSampling_Interval alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sampling_interval];
        }
        else if(avp.avpCode == [UMDiameterAvpReporting_Duration avpCode])
        {
            _var_reporting_duration = [[UMDiameterAvpReporting_Duration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reporting_duration];
        }
        else if(avp.avpCode == [UMDiameterAvpReporting_Location_Requirements avpCode])
        {
            _var_reporting_location_requirements = [[UMDiameterAvpReporting_Location_Requirements alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reporting_location_requirements];
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

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Area-Definition"] = [_var_area_definition objectValue];
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
    avpDef[@"name"] = @"area-event-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpArea_Definition definition];
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

