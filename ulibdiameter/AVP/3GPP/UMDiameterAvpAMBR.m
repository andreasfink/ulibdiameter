//
//  UMDiameterAvpAMBR.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 20:52:18.293000
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
        [_var_max_requested_bandwidth_ul beforeEncode];
        [arr addObject:_var_max_requested_bandwidth_ul];
    }
    if(_var_max_requested_bandwidth_dl)
    {
        [_var_max_requested_bandwidth_dl beforeEncode];
        [arr addObject:_var_max_requested_bandwidth_dl];
    }
    if(_var_extended_max_requested_bw_ul)
    {
        [_var_extended_max_requested_bw_ul beforeEncode];
        [arr addObject:_var_extended_max_requested_bw_ul];
    }
    if(_var_extended_max_requested_bw_dl)
    {
        [_var_extended_max_requested_bw_dl beforeEncode];
        [arr addObject:_var_extended_max_requested_bw_dl];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[max-requested-bandwidth-ul]",webName];
        [UMDiameterAvpMax_Requested_Bandwidth_UL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[max-requested-bandwidth-dl]",webName];
        [UMDiameterAvpMax_Requested_Bandwidth_DL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[extended-max-requested-bw-ul]",webName];
        [UMDiameterAvpExtended_Max_Requested_BW_UL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[extended-max-requested-bw-dl]",webName];
        [UMDiameterAvpExtended_Max_Requested_BW_DL appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Max-Requested-Bandwidth-UL"] = [_var_max_requested_bandwidth_ul objectValue];
	dict[@"Max-Requested-Bandwidth-DL"] = [_var_max_requested_bandwidth_dl objectValue];
	dict[@"Extended-Max-Requested-BW-UL"] = [_var_extended_max_requested_bw_ul objectValue];
	dict[@"Extended-Max-Requested-BW-DL"] = [_var_extended_max_requested_bw_dl objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"ambr";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpMax_Requested_Bandwidth_UL definition]];
    [entries addObject:[UMDiameterAvpMax_Requested_Bandwidth_DL definition]];
    [entries addObject:[UMDiameterAvpExtended_Max_Requested_BW_UL definition]];
    [entries addObject:[UMDiameterAvpExtended_Max_Requested_BW_DL definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

