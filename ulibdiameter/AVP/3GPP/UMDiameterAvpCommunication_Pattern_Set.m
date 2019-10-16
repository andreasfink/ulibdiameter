//
//  UMDiameterAvpCommunication_Pattern_Set.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
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
    [entries addObject:[UMDiameterAvpPeriodic_Communication_Indicator definition]];
    [entries addObject:[UMDiameterAvpCommunication_Duration_Time definition]];
    [entries addObject:[UMDiameterAvpPeriodic_Time definition]];
    [entries addObject:[UMDiameterAvpScheduled_Communication_Time definition]];
    [entries addObject:[UMDiameterAvpStationary_Indication definition]];
    [entries addObject:[UMDiameterAvpReference_ID_Validity_Time definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

