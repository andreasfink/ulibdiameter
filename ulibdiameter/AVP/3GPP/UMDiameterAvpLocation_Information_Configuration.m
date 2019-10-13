//
//  UMDiameterAvpLocation_Information_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLocation_Information_Configuration.h"
#import "UMDiameterAvpMONTE_Location_Type.h"
#import "UMDiameterAvpAccuracy.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpLocation_Information_Configuration


- (NSString *)avpType
{
    return @"Location-Information-Configuration";
}

- (uint32_t)avpCode
{
    return 3135;
}

+ (uint32_t)avpCode
{
    return 3135;
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
    if(_var_monte_location_type)
    {
        [o beforeEncode];
        [arr addObject:_var_monte_location_type];
    }
    if(_var_accuracy)
    {
        [o beforeEncode];
        [arr addObject:_var_accuracy];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[monte-location-type]",webName];
        [UMDiameterAvpMONTE_Location_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[accuracy]",webName];
        [UMDiameterAvpAccuracy appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

