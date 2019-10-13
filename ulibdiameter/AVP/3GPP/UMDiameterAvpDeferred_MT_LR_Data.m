//
//  UMDiameterAvpDeferred_MT_LR_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDeferred_MT_LR_Data.h"
#import "UMDiameterAvpDeferred_Location_Type.h"
#import "UMDiameterAvpTermination_Cause.h"

@implementation UMDiameterAvpDeferred_MT_LR_Data


- (NSString *)avpType
{
    return @"Deferred-MT-LR-Data";
}

- (uint32_t)avpCode
{
    return 2547;
}

+ (uint32_t)avpCode
{
    return 2547;
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
    if(_var_deferred_location_type)
    {
        [_var_deferred_location_type beforeEncode];
        [arr addObject:_var_deferred_location_type];
    }
    if(_var_termination_cause)
    {
        [_var_termination_cause beforeEncode];
        [arr addObject:_var_termination_cause];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[deferred-location-type]",webName];
        [UMDiameterAvpDeferred_Location_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[termination-cause]",webName];
        [UMDiameterAvpTermination_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

