//
//  UMDiameterAvpSCSCF_Restoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.961000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSCSCF_Restoration_Info.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpRestoration_Info.h"
#import "UMDiameterAvpSIP_Authentication_Scheme.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSCSCF_Restoration_Info


- (NSString *)avpType
{
    return @"SCSCF-Restoration-Info";
}

- (uint32_t)avpCode
{
    return 639;
}

+ (uint32_t)avpCode
{
    return 639;
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
    if(_var_user_name)
    {
        [_var_user_name beforeEncode];
        [arr addObject:_var_user_name];
    }
    if(_var_restoration_info.count > 0)
    {
        for(UMDiameterAvpRestoration_Info *o in _var_restoration_info)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_sip_authentication_scheme)
    {
        [_var_sip_authentication_scheme beforeEncode];
        [arr addObject:_var_sip_authentication_scheme];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[user-name]",webName];
        [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[restoration-info][]",webName];
        [UMDiameterAvpRestoration_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sip-authentication-scheme]",webName];
        [UMDiameterAvpSIP_Authentication_Scheme appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"User-Name"] = [_var_user_name objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_restoration_info.count>0)
		{
			for(UMDiameterAvp *avp in _var_restoration_info)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Restoration-Info"] = arr;
		}
	}
	dict[@"SIP-Authentication-Scheme"] = [_var_sip_authentication_scheme objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"scscf-restoration-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUser_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRestoration_Info definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        def[@"minimum-count"]=@(1);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSIP_Authentication_Scheme definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

