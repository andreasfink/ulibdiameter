//
//  UMDiameterAvpEPS_Subscribed_QoS_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_Subscribed_QoS_Profile.h"
#import "UMDiameterAvpQoS_Class_Identifier.h"
#import "UMDiameterAvpAllocation_Retention_Priority.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEPS_Subscribed_QoS_Profile


- (NSString *)avpType
{
    return @"EPS-Subscribed-QoS-Profile";
}

- (uint32_t)avpCode
{
    return 1431;
}

+ (uint32_t)avpCode
{
    return 1431;
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
    if(_var_qos_class_identifier)
    {
        [_var_qos_class_identifier beforeEncode];
        [arr addObject:_var_qos_class_identifier];
    }
    if(_var_allocation_retention_priority)
    {
        [_var_allocation_retention_priority beforeEncode];
        [arr addObject:_var_allocation_retention_priority];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[qos-class-identifier]",webName];
        [UMDiameterAvpQoS_Class_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[allocation-retention-priority]",webName];
        [UMDiameterAvpAllocation_Retention_Priority appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"QoS-Class-Identifier"] = [_var_qos_class_identifier objectValue];
	dict[@"Allocation-Retention-Priority"] = [_var_allocation_retention_priority objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"eps-subscribed-qos-profile";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpQoS_Class_Identifier definition]];
    [entries addObject:[UMDiameterAvpAllocation_Retention_Priority definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

