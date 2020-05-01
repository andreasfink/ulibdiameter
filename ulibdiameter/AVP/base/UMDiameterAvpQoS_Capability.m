//
//  UMDiameterAvpQoS_Capability.m
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:21:15.505910
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpQoS_Capability.h"
#import "UMDiameterAvpQoS_Profile_Template.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpQoS_Capability


- (NSString *)avpType
{
    return @"QoS-Capability";
}

- (uint32_t)avpCode
{
    return 578;
}

+ (uint32_t)avpCode
{
    return 578;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_qos_profile_template.count > 0)
    {
        for(UMDiameterAvpQoS_Profile_Template *o in _var_qos_profile_template)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[qos-profile-template][]",webName];
        [UMDiameterAvpQoS_Profile_Template appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
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
		if(_var_qos_profile_template.count>0)
		{
			for(UMDiameterAvp *avp in _var_qos_profile_template)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"QoS-Profile-Template"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"qos-capability";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpQoS_Profile_Template definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        def[@"minimum-count"]=@(1);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

