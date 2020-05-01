//
//  UMDiameterAvpWLAN_offloadability.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpWLAN_offloadability.h"
#import "UMDiameterAvpWLAN_offloadability_EUTRAN.h"
#import "UMDiameterAvpWLAN_offloadability_UTRAN.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpWLAN_offloadability


- (NSString *)avpType
{
    return @"WLAN-offloadability";
}

- (uint32_t)avpCode
{
    return 1667;
}

+ (uint32_t)avpCode
{
    return 1667;
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
    if(_var_wlan_offloadability_eutran)
    {
        [_var_wlan_offloadability_eutran beforeEncode];
        [arr addObject:_var_wlan_offloadability_eutran];
    }
    if(_var_wlan_offloadability_utran)
    {
        [_var_wlan_offloadability_utran beforeEncode];
        [arr addObject:_var_wlan_offloadability_utran];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[wlan-offloadability-eutran]",webName];
        [UMDiameterAvpWLAN_offloadability_EUTRAN appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[wlan-offloadability-utran]",webName];
        [UMDiameterAvpWLAN_offloadability_UTRAN appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"WLAN-offloadability-EUTRAN"] = [_var_wlan_offloadability_eutran objectValue];
	dict[@"WLAN-offloadability-UTRAN"] = [_var_wlan_offloadability_utran objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"wlan-offloadability";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpWLAN_offloadability_EUTRAN definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpWLAN_offloadability_UTRAN definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

