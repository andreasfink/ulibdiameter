//
//  UMDiameterAvpMBSFN_Area.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMBSFN_Area.h"
#import "UMDiameterAvpMBSFN_Area_ID.h"
#import "UMDiameterAvpCarrier_Frequency.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpMBSFN_Area


- (NSString *)avpType
{
    return @"MBSFN-Area";
}

- (uint32_t)avpCode
{
    return 1694;
}

+ (uint32_t)avpCode
{
    return 1694;
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
    if(_var_mbsfn_area_id)
    {
        [arr addObject:_var_mbsfn_area_id];
    }
    if(_var_carrier_frequency)
    {
        [arr addObject:_var_carrier_frequency];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[mbsfn-area-id]",webName];
        [UMDiameterAvpMBSFN_Area_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[carrier-frequency]",webName];
        [UMDiameterAvpCarrier_Frequency appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

