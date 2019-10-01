//
//  UMDiameterAvpLCS_EPS_Client_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_EPS_Client_Name.h"
#import "UMDiameterAvpLCS_Name_String.h"
#import "UMDiameterAvpLCS_Format_Indicator.h"

@implementation UMDiameterAvpLCS_EPS_Client_Name


- (NSString *)avpType
{
    return @"LCS-EPS-Client-Name";
}

- (uint32_t)avpCode
{
    return 2501;
}

+ (uint32_t)avpCode
{
    return 2501;
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
    if(_var_lcs_name_string)
    {
        [arr addObject:_var_lcs_name_string];
    }
    if(_var_lcs_format_indicator)
    {
        [arr addObject:_var_lcs_format_indicator];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-name-string]",webName];
        [UMDiameterAvpLCS_Name_String appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-format-indicator]",webName];
        [UMDiameterAvpLCS_Format_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end
