//
//  UMDiameterAvpEPS_User_State.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_User_State.h"
#import "UMDiameterAvpMME_User_State.h"
#import "UMDiameterAvpSGSN_User_State.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEPS_User_State


- (NSString *)avpType
{
    return @"EPS-User-State";
}

- (uint32_t)avpCode
{
    return 1495;
}

+ (uint32_t)avpCode
{
    return 1495;
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
    if(_var_mme_user_state)
    {
        [arr addObject:_var_mme_user_state];
    }
    if(_var_sgsn_user_state)
    {
        [arr addObject:_var_sgsn_user_state];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@.mme-user-state",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpMME_User_State appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.sgsn-user-state",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpSGSN_User_State appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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

