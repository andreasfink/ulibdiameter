//
//  UMDiameterAvpAMBR.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 21:43:34.608000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAMBR.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_UL.h"
#import "UMDiameterAvpMax_Requested_Bandwidth_DL.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_UL.h"
#import "UMDiameterAvpExtended_Max_Requested_BW_DL.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAMBR


- (NSString *)avpType
{
    return @"AMBR";
}

- (uint32_t)avpCode
{
    return 1435;
}

+ (uint32_t)avpCode
{
    return 1435;
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
    if(_var_max_requested_bandwidth_ul)
    {
        [arr addObject:_var_max_requested_bandwidth_ul];
    }
    if(_var_max_requested_bandwidth_dl)
    {
        [arr addObject:_var_max_requested_bandwidth_dl];
    }
    if(_var_extended_max_requested_bw_ul)
    {
        [arr addObject:_var_extended_max_requested_bw_ul];
    }
    if(_var_extended_max_requested_bw_dl)
    {
        [arr addObject:_var_extended_max_requested_bw_dl];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[max-requested-bandwidth-ul]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpMax_Requested_Bandwidth_UL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[max-requested-bandwidth-dl]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpMax_Requested_Bandwidth_DL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[extended-max-requested-bw-ul]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpExtended_Max_Requested_BW_UL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[extended-max-requested-bw-dl]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpExtended_Max_Requested_BW_DL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[][avp]",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpAVP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

