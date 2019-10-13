//
//  UMDiameterAvpPeriodic_LDR_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPeriodic_LDR_Information.h"
#import "UMDiameterAvpReporting_Amount.h"
#import "UMDiameterAvpReporting_Interval.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpPeriodic_LDR_Information


- (NSString *)avpType
{
    return @"Periodic-LDR-Information";
}

- (uint32_t)avpCode
{
    return 2540;
}

+ (uint32_t)avpCode
{
    return 2540;
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
    if(_var_reporting_amount)
    {
        [o beforeEncode];
        [arr addObject:_var_reporting_amount];
    }
    if(_var_reporting_interval)
    {
        [o beforeEncode];
        [arr addObject:_var_reporting_interval];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-amount]",webName];
        [UMDiameterAvpReporting_Amount appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[reporting-interval]",webName];
        [UMDiameterAvpReporting_Interval appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

