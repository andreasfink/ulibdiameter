//
//  UMDiameterAvpUE_Reachability_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUE_Reachability_Configuration.h"
#import "UMDiameterAvpReachability_Type.h"
#import "UMDiameterAvpMaximum_Response_Time.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUE_Reachability_Configuration


- (NSString *)avpType
{
    return @"UE-Reachability-Configuration";
}

- (uint32_t)avpCode
{
    return 3129;
}

+ (uint32_t)avpCode
{
    return 3129;
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
    if(_var_reachability_type)
    {
        [_var_reachability_type beforeEncode];
        [arr addObject:_var_reachability_type];
    }
    if(_var_maximum_response_time)
    {
        [_var_maximum_response_time beforeEncode];
        [arr addObject:_var_maximum_response_time];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[reachability-type]",webName];
        [UMDiameterAvpReachability_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[maximum-response-time]",webName];
        [UMDiameterAvpMaximum_Response_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Reachability-Type"] = [_var_reachability_type objectValue];
	dict[@"Maximum-Response-Time"] = [_var_maximum_response_time objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"ue-reachability-configuration";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpReachability_Type definition]];
    [entries addObject:[UMDiameterAvpMaximum_Response_Time definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

