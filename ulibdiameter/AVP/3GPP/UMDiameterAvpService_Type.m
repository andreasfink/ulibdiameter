//
//  UMDiameterAvpService_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.138000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Type.h"
#import "UMDiameterAvpServiceTypeIdentity.h"
#import "UMDiameterAvpGMLC_Restriction.h"
#import "UMDiameterAvpNotification_To_UE_User.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpService_Type


- (NSString *)avpType
{
    return @"Service-Type";
}

- (uint32_t)avpCode
{
    return 1483;
}

+ (uint32_t)avpCode
{
    return 1483;
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
    if(_var_servicetypeidentity)
    {
        [arr addObject:_var_servicetypeidentity];
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
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[servicetypeidentity]",webName];
        [UMDiameterAvpServiceTypeIdentity appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[gmlc-restriction]",webName];
        [UMDiameterAvpGMLC_Restriction appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[notification-to-ue-user]",webName];
        [UMDiameterAvpNotification_To_UE_User appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

