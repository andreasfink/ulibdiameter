//
//  UMDiameterAvpMonitoring_Event_Report.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpMonitoring_Event_Report.h>
#import <ulibdiameter/UMDiameterAvpSCEF_Reference_ID.h>
#import <ulibdiameter/UMDiameterAvpSCEF_ID.h>
#import <ulibdiameter/UMDiameterAvpReachability_Information.h>
#import <ulibdiameter/UMDiameterAvpEPS_Location_Information.h>
#import <ulibdiameter/UMDiameterAvpMonitoring_Type.h>
#import <ulibdiameter/UMDiameterAvpLoss_Of_Connectivity_Reason.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpMonitoring_Event_Report


- (NSString *)avpType
{
    return @"Monitoring-Event-Report";
}

- (uint32_t)avpCode
{
    return 3123;
}

+ (uint32_t)avpCode
{
    return 3123;
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
    if(_var_scef_reference_id)
    {
        [_var_scef_reference_id beforeEncode];
        [arr addObject:_var_scef_reference_id];
    }
    if(_var_scef_id)
    {
        [_var_scef_id beforeEncode];
        [arr addObject:_var_scef_id];
    }
    if(_var_reachability_information)
    {
        [_var_reachability_information beforeEncode];
        [arr addObject:_var_reachability_information];
    }
    if(_var_eps_location_information)
    {
        [_var_eps_location_information beforeEncode];
        [arr addObject:_var_eps_location_information];
    }
    if(_var_monitoring_type)
    {
        [_var_monitoring_type beforeEncode];
        [arr addObject:_var_monitoring_type];
    }
    if(_var_loss_of_connectivity_reason)
    {
        [_var_loss_of_connectivity_reason beforeEncode];
        [arr addObject:_var_loss_of_connectivity_reason];
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
        if(avp.avpCode == [UMDiameterAvpSCEF_Reference_ID  avpCode])
        {
            _var_scef_reference_id = [[UMDiameterAvpSCEF_Reference_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_reference_id];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            _var_scef_id = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_id];
        }
        else if(avp.avpCode == [UMDiameterAvpReachability_Information avpCode])
        {
            _var_reachability_information = [[UMDiameterAvpReachability_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reachability_information];
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_Location_Information avpCode])
        {
            _var_eps_location_information = [[UMDiameterAvpEPS_Location_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_eps_location_information];
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Type avpCode])
        {
            _var_monitoring_type = [[UMDiameterAvpMonitoring_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monitoring_type];
        }
        else if(avp.avpCode == [UMDiameterAvpLoss_Of_Connectivity_Reason avpCode])
        {
            _var_loss_of_connectivity_reason = [[UMDiameterAvpLoss_Of_Connectivity_Reason alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_loss_of_connectivity_reason];
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
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-reference-id]",webName];
        [UMDiameterAvpSCEF_Reference_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-id]",webName];
        [UMDiameterAvpSCEF_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reachability-information]",webName];
        [UMDiameterAvpReachability_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[eps-location-information]",webName];
        [UMDiameterAvpEPS_Location_Information appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[monitoring-type]",webName];
        [UMDiameterAvpMonitoring_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[loss-of-connectivity-reason]",webName];
        [UMDiameterAvpLoss_Of_Connectivity_Reason appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SCEF-Reference-ID"] = [_var_scef_reference_id objectValue];
	dict[@"SCEF-ID"] = [_var_scef_id objectValue];
	dict[@"Reachability-Information"] = [_var_reachability_information objectValue];
	dict[@"EPS-Location-Information"] = [_var_eps_location_information objectValue];
	dict[@"Monitoring-Type"] = [_var_monitoring_type objectValue];
	dict[@"Loss-Of-Connectivity-Reason"] = [_var_loss_of_connectivity_reason objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"monitoring-event-report";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_Reference_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReachability_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpEPS_Location_Information definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMonitoring_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLoss_Of_Connectivity_Reason definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

