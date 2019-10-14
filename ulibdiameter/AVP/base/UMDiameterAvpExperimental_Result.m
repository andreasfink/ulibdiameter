//
//  UMDiameterAvpExperimental_Result.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:52:18.180000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpExperimental_Result_Code.h"

@implementation UMDiameterAvpExperimental_Result


- (NSString *)avpType
{
    return @"Experimental-Result";
}

- (uint32_t)avpCode
{
    return 297;
}

+ (uint32_t)avpCode
{
    return 297;
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
    if(_var_vendor_id)
    {
        [_var_vendor_id beforeEncode];
        [arr addObject:_var_vendor_id];
    }
    if(_var_experimental_result_code)
    {
        [_var_experimental_result_code beforeEncode];
        [arr addObject:_var_experimental_result_code];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[vendor-id]",webName];
        [UMDiameterAvpVendor_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[experimental-result-code]",webName];
        [UMDiameterAvpExperimental_Result_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Vendor-Id"] = [_var_vendor_id objectValue];
	dict[@"Experimental-Result-Code"] = [_var_experimental_result_code objectValue];
	return dict;
}


@end

