//
//  UMDiameterAvpDeregistration_Reason.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDeregistration_Reason.h"
#import "UMDiameterAvpReason_Code.h"
#import "UMDiameterAvpReason_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpDeregistration_Reason


- (NSString *)avpType
{
    return @"Deregistration-Reason";
}

- (uint32_t)avpCode
{
    return 615;
}

+ (uint32_t)avpCode
{
    return 615;
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
    if(_var_reason_code)
    {
        [arr addObject:_var_reason_code];
    }
    if(_var_reason_info)
    {
        [arr addObject:_var_reason_info];
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
    [s appendString:@"<table class=\"avp-grouped\">\n"];
    [s appendFormat:@"<td>%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.reason-code",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpReason_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.reason-info",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpReason_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[].avp",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpAVP appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
    [s appendString:@"</td>\n"];
    [s appendString:@"</table>\n"];
    [s appendString:@"</tr>\n"];
}

@end

