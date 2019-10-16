//
//  UMDiameterAvpLocal_Time_Zone.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocal_Time_Zone.h"
#import "UMDiameterAvpTime_Zone.h"
#import "UMDiameterAvpDaylight_Saving_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLocal_Time_Zone


- (NSString *)avpType
{
    return @"Local-Time-Zone";
}

- (uint32_t)avpCode
{
    return 1649;
}

+ (uint32_t)avpCode
{
    return 1649;
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
    if(_var_time_zone)
    {
        [_var_time_zone beforeEncode];
        [arr addObject:_var_time_zone];
    }
    if(_var_daylight_saving_time)
    {
        [_var_daylight_saving_time beforeEncode];
        [arr addObject:_var_daylight_saving_time];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[time-zone]",webName];
        [UMDiameterAvpTime_Zone appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[daylight-saving-time]",webName];
        [UMDiameterAvpDaylight_Saving_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Time-Zone"] = [_var_time_zone objectValue];
	dict[@"Daylight-Saving-Time"] = [_var_daylight_saving_time objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"local-time-zone";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpTime_Zone definition]];
    [entries addObject:[UMDiameterAvpDaylight_Saving_Time definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

