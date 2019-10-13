//
//  UMDiameterAvpPLMN_ID_List.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPLMN_ID_List.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpPeriodic_Location_Support_Indicator.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpPLMN_ID_List


- (NSString *)avpType
{
    return @"PLMN-ID-List";
}

- (uint32_t)avpCode
{
    return 2544;
}

+ (uint32_t)avpCode
{
    return 2544;
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
    if(_var_visited_plmn_id)
    {
        [o beforeEncode];
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_periodic_location_support_indicator)
    {
        [o beforeEncode];
        [arr addObject:_var_periodic_location_support_indicator];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[visited-plmn-id]",webName];
        [UMDiameterAvpVisited_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[periodic-location-support-indicator]",webName];
        [UMDiameterAvpPeriodic_Location_Support_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

