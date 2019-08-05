//
//  UMDiameterAvpGPRS_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:10:14.998000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGPRS_Subscription_Data.h"
#import "UMDiameterAvpComplete_Data_List_Included_Indicator.h"
#import "UMDiameterAvpPDP_Context.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpGPRS_Subscription_Data


- (NSString *)avpType
{
    return @"GPRS-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1467;
}

+ (uint32_t)avpCode
{
    return 1467;
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
    if(_var_complete_data_list_included_indicator)
    {
        [arr addObject:_var_complete_data_list_included_indicator];
    }
    if(_var_pdp_context.count > 0)
    {
        for(UMDiameterAvpPDP_Context *o in _var_pdp_context)
        {
            [arr addObject:o];
        }
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[complete-data-list-included-indicator]",webName];
        [UMDiameterAvpComplete_Data_List_Included_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[][pdp-context]",webName];
        [UMDiameterAvpPDP_Context appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

