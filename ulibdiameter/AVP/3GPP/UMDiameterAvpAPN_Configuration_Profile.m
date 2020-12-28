//
//  UMDiameterAvpAPN_Configuration_Profile.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:42:39.527659
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_Configuration_Profile.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpAdditional_Context_Identifier.h"
#import "UMDiameterAvpAll_APN_Configurations_Included_Indicator.h"
#import "UMDiameterAvpAPN_Configuration.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAPN_Configuration_Profile


- (NSString *)avpType
{
    return @"APN-Configuration-Profile";
}

- (uint32_t)avpCode
{
    return 1429;
}

+ (uint32_t)avpCode
{
    return 1429;
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
    if(_var_context_identifier)
    {
        [_var_context_identifier beforeEncode];
        [arr addObject:_var_context_identifier];
    }
    if(_var_additional_context_identifier)
    {
        [_var_additional_context_identifier beforeEncode];
        [arr addObject:_var_additional_context_identifier];
    }
    if(_var_all_apn_configurations_included_indicator)
    {
        [_var_all_apn_configurations_included_indicator beforeEncode];
        [arr addObject:_var_all_apn_configurations_included_indicator];
    }
    if(_var_apn_configuration.count > 0)
    {
        for(UMDiameterAvpAPN_Configuration *o in _var_apn_configuration)
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[context-identifier]",webName];
        [UMDiameterAvpContext_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[additional-context-identifier]",webName];
        [UMDiameterAvpAdditional_Context_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[all-apn-configurations-included-indicator]",webName];
        [UMDiameterAvpAll_APN_Configurations_Included_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[apn-configuration][]",webName];
        [UMDiameterAvpAPN_Configuration appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Context-Identifier"] = [_var_context_identifier objectValue];
	dict[@"Additional-Context-Identifier"] = [_var_additional_context_identifier objectValue];
	dict[@"All-APN-Configurations-Included-Indicator"] = [_var_all_apn_configurations_included_indicator objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_apn_configuration.count>0)
		{
			for(UMDiameterAvp *avp in _var_apn_configuration)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"APN-Configuration"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"apn-configuration-profile";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpContext_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAdditional_Context_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAll_APN_Configurations_Included_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAPN_Configuration definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        def[@"minimum-count"]=@(1);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

