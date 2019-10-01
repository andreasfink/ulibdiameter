//
//  UMDiameterAvpReporting_PLMN_List.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpReporting_PLMN_List.h"
#import "UMDiameterAvpPLMN_ID_List.h"
#import "UMDiameterAvpPrioritized_List_Indicator.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpReporting_PLMN_List


- (NSString *)avpType
{
    return @"Reporting-PLMN-List";
}

- (uint32_t)avpCode
{
    return 2543;
}

+ (uint32_t)avpCode
{
    return 2543;
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
    if(_var_plmn_id_list.count > 0)
    {
        for(UMDiameterAvpPLMN_ID_List *o in _var_plmn_id_list)
        {
            [arr addObject:o];
        }
    }
    if(_var_prioritized_list_indicator)
    {
        [arr addObject:_var_prioritized_list_indicator];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[plmn-id-list][]",webName];
        [UMDiameterAvpPLMN_ID_List appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[prioritized-list-indicator]",webName];
        [UMDiameterAvpPrioritized_List_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

