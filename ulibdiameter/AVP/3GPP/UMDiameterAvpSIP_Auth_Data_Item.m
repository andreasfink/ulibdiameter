//
//  UMDiameterAvpSIP_Auth_Data_Item.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpSIP_Item_Number  avpCode])
        {
            _var_sip_item_number = [[UMDiameterAvpSIP_Item_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sip_item_number];
        }
        else if(avp.avpCode == [UMDiameterAvpSIP_Authentication_Scheme avpCode])
        {
            _var_sip_authentication_scheme = [[UMDiameterAvpSIP_Authentication_Scheme alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sip_authentication_scheme];
        }
        else if(avp.avpCode == [UMDiameterAvpSIP_Authorization avpCode])
        {
            _var_sip_authorization = [[UMDiameterAvpSIP_Authorization alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sip_authorization];
        }
        else if(avp.avpCode == [UMDiameterAvpSIP_Authentication_Context avpCode])
        {
            _var_sip_authentication_context = [[UMDiameterAvpSIP_Authentication_Context alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sip_authentication_context];
        }
        else if(avp.avpCode == [UMDiameterAvpIntegrity_Key avpCode])
        {
            _var_integrity_key = [[UMDiameterAvpIntegrity_Key alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_integrity_key];
        }
        else if(avp.avpCode == [UMDiameterAvpSIP_Digest_Authenticate avpCode])
        {
            _var_sip_digest_authenticate = [[UMDiameterAvpSIP_Digest_Authenticate alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sip_digest_authenticate];
        }
        else if(avp.avpCode == [UMDiameterAvpFramed_IP_Address avpCode])
        {
            _var_framed_ip_address = [[UMDiameterAvpFramed_IP_Address alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_framed_ip_address];
        }
        else if(avp.avpCode == [UMDiameterAvpFramed_IPv6_Prefix avpCode])
        {
            _var_framed_ipv6_prefix = [[UMDiameterAvpFramed_IPv6_Prefix alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_framed_ipv6_prefix];
        }
        else if(avp.avpCode == [UMDiameterAvpFramed_Interface_Id avpCode])
        {
            _var_framed_interface_id = [[UMDiameterAvpFramed_Interface_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_framed_interface_id];
        }
        else if(avp.avpCode == [UMDiameterAvpLine_Identifier avpCode])
        {
            UMDiameterAvpLine_Identifier *avp2 = [[UMDiameterAvpLine_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_line_identifier == NULL)
            {
                _var_line_identifier = @[avp2];
            }
            else
            {
                _var_line_identifier = [_var_line_identifier arrayByAddingObject:avp2];
            }
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

