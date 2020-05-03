//
//  UMDiameterAvpSM_Delivery_Failure_Cause.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSM_Delivery_Failure_Cause.h"
#import "UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause.h"
#import "UMDiameterAvpSM_Diagnostic_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSM_Delivery_Failure_Cause


- (NSString *)avpType
{
    return @"SM-Delivery-Failure-Cause";
}

- (uint32_t)avpCode
{
    return 3303;
}

+ (uint32_t)avpCode
{
    return 3303;
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
    if(_var_sm_enumerated_delivery_failure_cause)
    {
        [_var_sm_enumerated_delivery_failure_cause beforeEncode];
        [arr addObject:_var_sm_enumerated_delivery_failure_cause];
    }
    if(_var_sm_diagnostic_info)
    {
        [_var_sm_diagnostic_info beforeEncode];
        [arr addObject:_var_sm_diagnostic_info];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[sm-enumerated-delivery-failure-cause]",webName];
        [UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sm-diagnostic-info]",webName];
        [UMDiameterAvpSM_Diagnostic_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SM-Enumerated-Delivery-Failure-Cause"] = [_var_sm_enumerated_delivery_failure_cause objectValue];
	dict[@"SM-Diagnostic-Info"] = [_var_sm_diagnostic_info objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"sm-delivery-failure-cause";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSM_Enumerated_Delivery_Failure_Cause definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSM_Diagnostic_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end
