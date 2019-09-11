//
//  UMDiameterAvpSIP_Auth_Data_Item.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSIP_Auth_Data_Item.h"
#import "UMDiameterAvpSIP_Item_Number.h"
#import "UMDiameterAvpSIP_Authentication_Scheme.h"
#import "UMDiameterAvpSIP_Authorization.h"
#import "UMDiameterAvpSIP_Authentication_Context.h"
#import "UMDiameterAvpIntegrity_Key.h"
#import "UMDiameterAvpSIP_Digest_Authenticate.h"
#import "UMDiameterAvpFramed_IP_Address.h"
#import "UMDiameterAvpFramed_IPv6_Prefix.h"
#import "UMDiameterAvpFramed_Interface_Id.h"
#import "UMDiameterAvpLine_Identifier.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSIP_Auth_Data_Item


- (NSString *)avpType
{
    return @"SIP-Auth-Data-Item";
}

- (uint32_t)avpCode
{
    return 612;
}

+ (uint32_t)avpCode
{
    return 612;
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
    if(_var_sip_item_number)
    {
        [arr addObject:_var_sip_item_number];
    }
    if(_var_sip_authentication_scheme)
    {
        [arr addObject:_var_sip_authentication_scheme];
    }
    if(_var_sip_authorization)
    {
        [arr addObject:_var_sip_authorization];
    }
    if(_var_sip_authentication_context)
    {
        [arr addObject:_var_sip_authentication_context];
    }
    if(_var_integrity_key)
    {
        [arr addObject:_var_integrity_key];
    }
    if(_var_sip_digest_authenticate)
    {
        [arr addObject:_var_sip_digest_authenticate];
    }
    if(_var_framed_ip_address)
    {
        [arr addObject:_var_framed_ip_address];
    }
    if(_var_framed_ipv6_prefix)
    {
        [arr addObject:_var_framed_ipv6_prefix];
    }
    if(_var_framed_interface_id)
    {
        [arr addObject:_var_framed_interface_id];
    }
    if(_var_line_identifier.count > 0)
    {
        for(UMDiameterAvpLine_Identifier *o in _var_line_identifier)
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


@end

