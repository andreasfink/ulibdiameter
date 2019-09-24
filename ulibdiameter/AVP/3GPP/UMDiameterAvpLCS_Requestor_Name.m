//
//  UMDiameterAvpLCS_Requestor_Name.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Requestor_Name.h"
#import "UMDiameterAvpLCS_Requestor_Id_String.h"
#import "UMDiameterAvpLCS_Format_Indicator.h"

@implementation UMDiameterAvpLCS_Requestor_Name


- (NSString *)avpType
{
    return @"LCS-Requestor-Name";
}

- (uint32_t)avpCode
{
    return 2502;
}

+ (uint32_t)avpCode
{
    return 2502;
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
    if(_var_lcs_requestor_id_string)
    {
        [arr addObject:_var_lcs_requestor_id_string];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-requestor-id-string]",webName];
        [UMDiameterAvpLCS_Requestor_Id_String appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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

