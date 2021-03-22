//
//  UMDiameterAvpMonitoring_Event_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMonitoring_Event_Configuration.h"
#import "UMDiameterAvpSCEF_Reference_ID.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpMonitoring_Type.h"
#import "UMDiameterAvpSCEF_Reference_ID_for_Deletion.h"
#import "UMDiameterAvpMaximum_Number_of_Reports.h"
#import "UMDiameterAvpMonitoring_Duration.h"
#import "UMDiameterAvpCharged_Party.h"
#import "UMDiameterAvpUE_Reachability_Configuration.h"
#import "UMDiameterAvpLocation_Information_Configuration.h"
#import "UMDiameterAvpSCEF_Realm.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMonitoring_Event_Configuration


- (NSString *)avpType
{
    return @"Monitoring-Event-Configuration";
}

- (uint32_t)avpCode
{
    return 3122;
}

+ (uint32_t)avpCode
{
    return 3122;
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
    if(_var_monitoring_type)
    {
        [_var_monitoring_type beforeEncode];
        [arr addObject:_var_monitoring_type];
    }
    if(_var_scef_reference_id_for_deletion.count > 0)
    {
        for(UMDiameterAvpSCEF_Reference_ID_for_Deletion *o in _var_scef_reference_id_for_deletion)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_maximum_number_of_reports)
    {
        [_var_maximum_number_of_reports beforeEncode];
        [arr addObject:_var_maximum_number_of_reports];
    }
    if(_var_monitoring_duration)
    {
        [_var_monitoring_duration beforeEncode];
        [arr addObject:_var_monitoring_duration];
    }
    if(_var_charged_party)
    {
        [_var_charged_party beforeEncode];
        [arr addObject:_var_charged_party];
    }
    if(_var_ue_reachability_configuration)
    {
        [_var_ue_reachability_configuration beforeEncode];
        [arr addObject:_var_ue_reachability_configuration];
    }
    if(_var_location_information_configuration)
    {
        [_var_location_information_configuration beforeEncode];
        [arr addObject:_var_location_information_configuration];
    }
    if(_var_scef_realm)
    {
        [_var_scef_realm beforeEncode];
        [arr addObject:_var_scef_realm];
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
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Type avpCode])
        {
            _var_monitoring_type = [[UMDiameterAvpMonitoring_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monitoring_type];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_Reference_ID_for_Deletion avpCode])
        {
            UMDiameterAvpSCEF_Reference_ID_for_Deletion *avp2 = [[UMDiameterAvpSCEF_Reference_ID_for_Deletion alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_scef_reference_id_for_deletion == NULL)
            {
                _var_scef_reference_id_for_deletion = @[avp2];
            }
            else
            {
                _var_scef_reference_id_for_deletion = [_var_scef_reference_id_for_deletion arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpMaximum_Number_of_Reports avpCode])
        {
            _var_maximum_number_of_reports = [[UMDiameterAvpMaximum_Number_of_Reports alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_maximum_number_of_reports];
        }
        else if(avp.avpCode == [UMDiameterAvpMonitoring_Duration avpCode])
        {
            _var_monitoring_duration = [[UMDiameterAvpMonitoring_Duration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_monitoring_duration];
        }
        else if(avp.avpCode == [UMDiameterAvpCharged_Party avpCode])
        {
            _var_charged_party = [[UMDiameterAvpCharged_Party alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_charged_party];
        }
        else if(avp.avpCode == [UMDiameterAvpUE_Reachability_Configuration avpCode])
        {
            _var_ue_reachability_configuration = [[UMDiameterAvpUE_Reachability_Configuration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ue_reachability_configuration];
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Information_Configuration avpCode])
        {
            _var_location_information_configuration = [[UMDiameterAvpLocation_Information_Configuration alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_location_information_configuration];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_Realm avpCode])
        {
            _var_scef_realm = [[UMDiameterAvpSCEF_Realm alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_realm];
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
        [UMDiameterAvpSCEF_Reference_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-id]",webName];
        [UMDiameterAvpSCEF_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[monitoring-type]",webName];
        [UMDiameterAvpMonitoring_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-reference-id-for-deletion][]",webName];
        [UMDiameterAvpSCEF_Reference_ID_for_Deletion appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[maximum-number-of-reports]",webName];
        [UMDiameterAvpMaximum_Number_of_Reports appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[monitoring-duration]",webName];
        [UMDiameterAvpMonitoring_Duration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[charged-party]",webName];
        [UMDiameterAvpCharged_Party appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ue-reachability-configuration]",webName];
        [UMDiameterAvpUE_Reachability_Configuration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[location-information-configuration]",webName];
        [UMDiameterAvpLocation_Information_Configuration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scef-realm]",webName];
        [UMDiameterAvpSCEF_Realm appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
	dict[@"Monitoring-Type"] = [_var_monitoring_type objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_scef_reference_id_for_deletion.count>0)
		{
			for(UMDiameterAvp *avp in _var_scef_reference_id_for_deletion)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"SCEF-Reference-ID-for-Deletion"] = arr;
		}
	}
	dict[@"Maximum-Number-of-Reports"] = [_var_maximum_number_of_reports objectValue];
	dict[@"Monitoring-Duration"] = [_var_monitoring_duration objectValue];
	dict[@"Charged-Party"] = [_var_charged_party objectValue];
	dict[@"UE-Reachability-Configuration"] = [_var_ue_reachability_configuration objectValue];
	dict[@"Location-Information-Configuration"] = [_var_location_information_configuration objectValue];
	dict[@"SCEF-Realm"] = [_var_scef_realm objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"monitoring-event-configuration";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_Reference_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMonitoring_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_Reference_ID_for_Deletion definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMaximum_Number_of_Reports definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMonitoring_Duration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCharged_Party definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUE_Reachability_Configuration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLocation_Information_Configuration definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSCEF_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

