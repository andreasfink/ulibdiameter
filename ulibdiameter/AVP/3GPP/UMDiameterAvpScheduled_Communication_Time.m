//
//  UMDiameterAvpScheduled_Communication_Time.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpScheduled_Communication_Time.h"
#import "UMDiameterAvpDay_Of_Week_Mask.h"
#import "UMDiameterAvpTime_Of_Day_Start.h"
#import "UMDiameterAvpTime_Of_Day_End.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpScheduled_Communication_Time


- (NSString *)avpType
{
    return @"Scheduled-Communication-Time";
}

- (uint32_t)avpCode
{
    return 3118;
}

+ (uint32_t)avpCode
{
    return 3118;
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
    if(_var_day_of_week_mask.count > 0)
    {
        for(UMDiameterAvpDay_Of_Week_Mask *o in _var_day_of_week_mask)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_time_of_day_start)
    {
        [_var_time_of_day_start beforeEncode];
        [arr addObject:_var_time_of_day_start];
    }
    if(_var_time_of_day_end)
    {
        [_var_time_of_day_end beforeEncode];
        [arr addObject:_var_time_of_day_end];
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
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpDay_Of_Week_Mask  avpCode])
        {
            UMDiameterAvpDay_Of_Week_Mask *avp2 = [[UMDiameterAvpDay_Of_Week_Mask alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_day_of_week_mask == NULL)
            {
                _var_day_of_week_mask = @[avp2];
            }
            else
            {
                _var_day_of_week_mask = [_var_day_of_week_mask arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTime_Of_Day_Start avpCode])
        {
            _var_time_of_day_start = [[UMDiameterAvpTime_Of_Day_Start alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_time_of_day_start];
        }
        else if(avp.avpCode == [UMDiameterAvpTime_Of_Day_End avpCode])
        {
            _var_time_of_day_end = [[UMDiameterAvpTime_Of_Day_End alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_time_of_day_end];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[day-of-week-mask][]",webName];
        [UMDiameterAvpDay_Of_Week_Mask appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[time-of-day-start]",webName];
        [UMDiameterAvpTime_Of_Day_Start appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[time-of-day-end]",webName];
        [UMDiameterAvpTime_Of_Day_End appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_day_of_week_mask.count>0)
		{
			for(UMDiameterAvp *avp in _var_day_of_week_mask)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Day-Of-Week-Mask"] = arr;
		}
	}
	dict[@"Time-Of-Day-Start"] = [_var_time_of_day_start objectValue];
	dict[@"Time-Of-Day-End"] = [_var_time_of_day_end objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"scheduled-communication-time";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDay_Of_Week_Mask definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTime_Of_Day_Start definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTime_Of_Day_End definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

