//
//  UMDiameterAvpDelayed_Location_Reporting_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDelayed_Location_Reporting_Data.h"
#import "UMDiameterAvpTermination_Cause.h"
#import "UMDiameterAvpServing_Node.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpDelayed_Location_Reporting_Data


- (NSString *)avpType
{
    return @"Delayed-Location-Reporting-Data";
}

- (uint32_t)avpCode
{
    return 2555;
}

+ (uint32_t)avpCode
{
    return 2555;
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
    if(_var_termination_cause)
    {
        [_var_termination_cause beforeEncode];
        [arr addObject:_var_termination_cause];
    }
    if(_var_serving_node)
    {
        [_var_serving_node beforeEncode];
        [arr addObject:_var_serving_node];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[termination-cause]",webName];
        [UMDiameterAvpTermination_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[serving-node]",webName];
        [UMDiameterAvpServing_Node appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Termination-Cause"] = [_var_termination_cause objectValue];
	dict[@"Serving-Node"] = [_var_serving_node objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"delayed-location-reporting-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpTermination_Cause definition]];
    [entries addObject:[UMDiameterAvpServing_Node definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

