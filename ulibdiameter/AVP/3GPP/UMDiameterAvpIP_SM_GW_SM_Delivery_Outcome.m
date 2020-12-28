//
//  UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome.h"
#import "UMDiameterAvpSM_Delivery_Cause.h"
#import "UMDiameterAvpAbsent_User_Diagnostic_SM.h"

@implementation UMDiameterAvpIP_SM_GW_SM_Delivery_Outcome


- (NSString *)avpType
{
    return @"IP-SM-GW-SM-Delivery-Outcome";
}

- (uint32_t)avpCode
{
    return 3320;
}

+ (uint32_t)avpCode
{
    return 3320;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 3320 */
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 3320;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_sm_delivery_cause)
    {
        [_var_sm_delivery_cause beforeEncode];
        [arr addObject:_var_sm_delivery_cause];
    }
    if(_var_absent_user_diagnostic_sm)
    {
        [_var_absent_user_diagnostic_sm beforeEncode];
        [arr addObject:_var_absent_user_diagnostic_sm];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[sm-delivery-cause]",webName];
        [UMDiameterAvpSM_Delivery_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[absent-user-diagnostic-sm]",webName];
        [UMDiameterAvpAbsent_User_Diagnostic_SM appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SM-Delivery-Cause"] = [_var_sm_delivery_cause objectValue];
	dict[@"Absent-User-Diagnostic-SM"] = [_var_absent_user_diagnostic_sm objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"ip-sm-gw-sm-delivery-outcome";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSM_Delivery_Cause definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAbsent_User_Diagnostic_SM definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

