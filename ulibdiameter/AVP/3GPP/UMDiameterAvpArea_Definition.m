//
//  UMDiameterAvpArea_Definition.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Definition.h"
#import "UMDiameterAvpArea.h"
#import "UMDiameterAvpAdditional_Area.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpArea_Definition


- (NSString *)avpType
{
    return @"Area-Definition";
}

- (uint32_t)avpCode
{
    return 2534;
}

+ (uint32_t)avpCode
{
    return 2534;
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
    if(_var_area.count > 0)
    {
        for(UMDiameterAvpArea *o in _var_area)
        {
            [arr addObject:o];
        }
    }
    if(_var_additional_area.count > 0)
    {
        for(UMDiameterAvpAdditional_Area *o in _var_additional_area)
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[area][]",webName];
        [UMDiameterAvpArea appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[additional-area][]",webName];
        [UMDiameterAvpAdditional_Area appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end
