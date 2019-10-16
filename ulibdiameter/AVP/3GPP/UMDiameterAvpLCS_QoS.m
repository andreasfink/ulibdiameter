//
//  UMDiameterAvpLCS_QoS.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_QoS.h"
#import "UMDiameterAvpLCS_QoS_Class.h"
#import "UMDiameterAvpHorizontal_Accuracy.h"
#import "UMDiameterAvpVertical_Accuracy.h"
#import "UMDiameterAvpVertical_Requested.h"
#import "UMDiameterAvpResponse_Time.h"

@implementation UMDiameterAvpLCS_QoS


- (NSString *)avpType
{
    return @"LCS-QoS";
}

- (uint32_t)avpCode
{
    return 2504;
}

+ (uint32_t)avpCode
{
    return 2504;
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
    if(_var_lcs_qos_class)
    {
        [_var_lcs_qos_class beforeEncode];
        [arr addObject:_var_lcs_qos_class];
    }
    if(_var_horizontal_accuracy)
    {
        [_var_horizontal_accuracy beforeEncode];
        [arr addObject:_var_horizontal_accuracy];
    }
    if(_var_vertical_accuracy)
    {
        [_var_vertical_accuracy beforeEncode];
        [arr addObject:_var_vertical_accuracy];
    }
    if(_var_vertical_requested)
    {
        [_var_vertical_requested beforeEncode];
        [arr addObject:_var_vertical_requested];
    }
    if(_var_response_time)
    {
        [_var_response_time beforeEncode];
        [arr addObject:_var_response_time];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-qos-class]",webName];
        [UMDiameterAvpLCS_QoS_Class appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[horizontal-accuracy]",webName];
        [UMDiameterAvpHorizontal_Accuracy appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[vertical-accuracy]",webName];
        [UMDiameterAvpVertical_Accuracy appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[vertical-requested]",webName];
        [UMDiameterAvpVertical_Requested appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[response-time]",webName];
        [UMDiameterAvpResponse_Time appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"LCS-QoS-Class"] = [_var_lcs_qos_class objectValue];
	dict[@"Horizontal-Accuracy"] = [_var_horizontal_accuracy objectValue];
	dict[@"Vertical-Accuracy"] = [_var_vertical_accuracy objectValue];
	dict[@"Vertical-Requested"] = [_var_vertical_requested objectValue];
	dict[@"Response-Time"] = [_var_response_time objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"lcs-qos";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpLCS_QoS_Class definition]];
    [entries addObject:[UMDiameterAvpHorizontal_Accuracy definition]];
    [entries addObject:[UMDiameterAvpVertical_Accuracy definition]];
    [entries addObject:[UMDiameterAvpVertical_Requested definition]];
    [entries addObject:[UMDiameterAvpResponse_Time definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

