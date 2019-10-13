//
//  UMDiameterAvpCall_Reference_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCall_Reference_Info.h"
#import "UMDiameterAvpCall_Reference_Number.h"
#import "UMDiameterAvpAS_Number.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpCall_Reference_Info


- (NSString *)avpType
{
    return @"Call-Reference-Info";
}

- (uint32_t)avpCode
{
    return 720;
}

+ (uint32_t)avpCode
{
    return 720;
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
    if(_var_call_reference_number)
    {
        [o beforeEncode];
        [arr addObject:_var_call_reference_number];
    }
    if(_var_as_number)
    {
        [o beforeEncode];
        [arr addObject:_var_as_number];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[call-reference-number]",webName];
        [UMDiameterAvpCall_Reference_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[as-number]",webName];
        [UMDiameterAvpAS_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

