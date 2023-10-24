//
//  UMDiameterAvpCommunication_Pattern_Set.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCommunication_Pattern_Set.h"
#import "UMDiameterAvpPeriodic_Communication_Indicator.h"
#import "UMDiameterAvpCommunication_Duration_Time.h"
#import "UMDiameterAvpPeriodic_Time.h"
#import "UMDiameterAvpScheduled_Communication_Time.h"
#import "UMDiameterAvpStationary_Indication.h"
#import "UMDiameterAvpReference_ID_Validity_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpCommunication_Pattern_Set


- (NSString *)avpType
{
    return @"Communication-Pattern-Set";
}

- (uint32_t)avpCode
{
    return 3114;
}

+ (uint32_t)avpCode
{
    return 3114;
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
    if(_var_periodic_communication_indicator)
    {
        [_var_periodic_communication_indicator beforeEncode];
        [arr addObject:_var_periodic_communication_indicator];
    }
    if(_var_communication_duration_time)
    {
        [_var_communication_duration_time beforeEncode];
        [arr addObject:_var_communication_duration_time];
    }
    if(_var_periodic_time)
    {
        [_var_periodic_time beforeEncode];
        [arr addObject:_var_periodic_time];
    }
    if(_var_scheduled_communication_time.count > 0)
    {
        for(UMDiameterAvpScheduled_Communication_Time *o in _var_scheduled_communication_time)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_stationary_indication)
    {
        [_var_stationary_indication beforeEncode];
        [arr addObject:_var_stationary_indication];
    }
    if(_var_reference_id_validity_time)
    {
        [_var_reference_id_validity_time beforeEncode];
        [arr addObject:_var_reference_id_validity_time];
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
        if(avp.avpCode == [UMDiameterAvpPeriodic_Communication_Indicator  avpCode])
        {
            _var_periodic_communication_indicator = [[UMDiameterAvpPeriodic_Communication_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_periodic_communication_indicator];
        }
        else if(avp.avpCode == [UMDiameterAvpCommunication_Duration_Time avpCode])
        {
            _var_communication_duration_time = [[UMDiameterAvpCommunication_Duration_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_communication_duration_time];
        }
        else if(avp.avpCode == [UMDiameterAvpPeriodic_Time avpCode])
        {
            _var_periodic_time = [[UMDiameterAvpPeriodic_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_periodic_time];
        }
        else if(avp.avpCode == [UMDiameterAvpScheduled_Communication_Time avpCode])
        {
            UMDiameterAvpScheduled_Communication_Time *avp2 = [[UMDiameterAvpScheduled_Communication_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_scheduled_communication_time == NULL)
            {
                _var_scheduled_communication_time = @[avp2];
            }
            else
            {
                _var_scheduled_communication_time = [_var_scheduled_communication_time arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpStationary_Indication avpCode])
        {
            _var_stationary_indication = [[UMDiameterAvpStationary_Indication alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_stationary_indication];
        }
        else if(avp.avpCode == [UMDiameterAvpReference_ID_Validity_Time avpCode])
        {
            _var_reference_id_validity_time = [[UMDiameterAvpReference_ID_Validity_Time alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_reference_id_validity_time];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[periodic-communication-indicator]",webName];
        [UMDiameterAvpPeriodic_Communication_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[communication-duration-time]",webName];
        [UMDiameterAvpCommunication_Duration_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[periodic-time]",webName];
        [UMDiameterAvpPeriodic_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[scheduled-communication-time][]",webName];
        [UMDiameterAvpScheduled_Communication_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[stationary-indication]",webName];
        [UMDiameterAvpStationary_Indication appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reference-id-validity-time]",webName];
        [UMDiameterAvpReference_ID_Validity_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Periodic-Communication-Indicator"] = [_var_periodic_communication_indicator objectValue];
	dict[@"Communication-Duration-Time"] = [_var_communication_duration_time objectValue];
	dict[@"Periodic-Time"] = [_var_periodic_time objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_scheduled_communication_time.count>0)
		{
			for(UMDiameterAvp *avp in _var_scheduled_communication_time)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Scheduled-Communication-Time"] = arr;
		}
	}
	dict[@"Stationary-Indication"] = [_var_stationary_indication objectValue];
	dict[@"Reference-ID-Validity-Time"] = [_var_reference_id_validity_time objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"communication-pattern-set";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPeriodic_Communication_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCommunication_Duration_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPeriodic_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpScheduled_Communication_Time definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpStationary_Indication definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpReference_ID_Validity_Time definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

