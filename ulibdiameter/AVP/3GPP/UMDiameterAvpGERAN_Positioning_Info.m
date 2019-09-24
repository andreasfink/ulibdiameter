//
//  UMDiameterAvpGERAN_Positioning_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGERAN_Positioning_Info.h"
#import "UMDiameterAvpGERAN_Positioning_Data.h"
#import "UMDiameterAvpGERAN_GANSS_Positioning_Data.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpGERAN_Positioning_Info


- (NSString *)avpType
{
    return @"GERAN-Positioning-Info";
}

- (uint32_t)avpCode
{
    return 2524;
}

+ (uint32_t)avpCode
{
    return 2524;
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
    if(_var_geran_positioning_data)
    {
        [arr addObject:_var_geran_positioning_data];
    }
    if(_var_geran_ganss_positioning_data)
    {
        [arr addObject:_var_geran_ganss_positioning_data];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[geran-positioning-data]",webName];
        [UMDiameterAvpGERAN_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[geran-ganss-positioning-data]",webName];
        [UMDiameterAvpGERAN_GANSS_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

