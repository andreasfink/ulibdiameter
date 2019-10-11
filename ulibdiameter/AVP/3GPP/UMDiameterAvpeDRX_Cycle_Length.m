//
//  UMDiameterAvpeDRX_Cycle_Length.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:52:17.645000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpeDRX_Cycle_Length.h"
#import "UMDiameterAvpRAT_Type.h"
#import "UMDiameterAvpeDRX_Cycle_Length_Value.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpeDRX_Cycle_Length


- (NSString *)avpType
{
    return @"eDRX-Cycle-Length";
}

- (uint32_t)avpCode
{
    return 1691;
}

+ (uint32_t)avpCode
{
    return 1691;
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
    if(_var_rat_type)
    {
        [arr addObject:_var_rat_type];
    }
    if(_var_edrx_cycle_length_value)
    {
        [arr addObject:_var_edrx_cycle_length_value];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[rat-type]",webName];
        [UMDiameterAvpRAT_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[edrx-cycle-length-value]",webName];
        [UMDiameterAvpeDRX_Cycle_Length_Value appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

