//
//  UMDiameterAvpExternal_Client.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.400000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExternal_Client.h"
#import "UMDiameterAvpClient_Identity.h"
#import "UMDiameterAvpGMLC_Restriction.h"
#import "UMDiameterAvpNotification_To_UE_User.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpExternal_Client


- (NSString *)avpType
{
    return @"External-Client";
}

- (uint32_t)avpCode
{
    return 1479;
}

+ (uint32_t)avpCode
{
    return 1479;
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
    if(_var_client_identity)
    {
        [arr addObject:_var_client_identity];
    }
    if(_var_gmlc_restriction)
    {
        [arr addObject:_var_gmlc_restriction];
    }
    if(_var_notification_to_ue_user)
    {
        [arr addObject:_var_notification_to_ue_user];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@.client-identity",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpClient_Identity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.gmlc-restriction",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpGMLC_Restriction appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
        [s appendString:@"        </td>\n"];
        [s appendString:@"    </tr>\n"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@.notification-to-ue-user",webName];
        [s appendString:@"    <tr>\n"];
        [s appendString:@"        <td>\n"];
        [UMDiameterAvpNotification_To_UE_User appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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

