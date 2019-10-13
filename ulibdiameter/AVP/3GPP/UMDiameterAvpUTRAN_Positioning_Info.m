//
//  UMDiameterAvpUTRAN_Positioning_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Positioning_Info.h"
#import "UMDiameterAvpUTRAN_Positioning_Data.h"
#import "UMDiameterAvpUTRAN_GANSS_Positioning_Data.h"
#import "UMDiameterAvpUTRAN_Additional_Positioning_Data.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUTRAN_Positioning_Info


- (NSString *)avpType
{
    return @"UTRAN-Positioning-Info";
}

- (uint32_t)avpCode
{
    return 2527;
}

+ (uint32_t)avpCode
{
    return 2527;
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
    if(_var_utran_positioning_data)
    {
        [arr addObject:_var_utran_positioning_data];
    }
    if(_var_utran_ganss_positioning_data)
    {
        [arr addObject:_var_utran_ganss_positioning_data];
    }
    if(_var_utran_additional_positioning_data)
    {
        [arr addObject:_var_utran_additional_positioning_data];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[utran-positioning-data]",webName];
        [UMDiameterAvpUTRAN_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[utran-ganss-positioning-data]",webName];
        [UMDiameterAvpUTRAN_GANSS_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[utran-additional-positioning-data]",webName];
        [UMDiameterAvpUTRAN_Additional_Positioning_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

