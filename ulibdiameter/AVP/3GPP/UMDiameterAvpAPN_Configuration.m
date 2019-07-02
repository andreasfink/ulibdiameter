//
//  UMDiameterAvpAPN_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_Configuration.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpServed_Party_IP_Address.h"
#import "UMDiameterAvpPDN_Type.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvpEPS_Subscribed_QoS_Profile.h"
#import "UMDiameterAvpVPLMN_Dynamic_Address_Allowed.h"
#import "UMDiameterAvpMIP6_Agent_Info.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"

@implementation UMDiameterAvpAPN_Configuration


- (NSString *)avpType
{
    return @"APN-Configuration";
}

- (uint32_t)avpCode
{
    return 1430;
}

+ (uint32_t)avpCode
{
    return 1430;
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
    if(_var_context_identifier)
    {
        [arr addObject:_var_context_identifier];
    }
    if(_var_served_party_ip_address.count > 0)
    {
        for(UMDiameterAvpServed_Party_IP_Address *o in _var_served_party_ip_address)
        {
            [arr addObject:o];
        }
    }
    if(_var_pdn_type)
    {
        [arr addObject:_var_pdn_type];
    }
    if(_var_service_selection)
    {
        [arr addObject:_var_service_selection];
    }
    if(_var_eps_subscribed_qos_profile)
    {
        [arr addObject:_var_eps_subscribed_qos_profile];
    }
    if(_var_vplmn_dynamic_address_allowed)
    {
        [arr addObject:_var_vplmn_dynamic_address_allowed];
    }
    if(_var_mip6_agent_info)
    {
        [arr addObject:_var_mip6_agent_info];
    }
    if(_var_visited_network_identifier)
    {
        [arr addObject:_var_visited_network_identifier];
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
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            _var_context_identifier = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_context_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpServed_Party_IP_Address avpCode])
        {
            avp = [[UMDiameterAvpServed_Party_IP_Address alloc]initWithAvp:avp];
            _var_served_party_ip_address = avp;
            [knownAVPs addObject:avp];
            if(_var_served_party_ip_address == NULL)
            {
                _var_served_party_ip_address = @[avp];
            }
            else
            {
                _var_served_party_ip_address = [_var_served_party_ip_address arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPDN_Type avpCode])
        {
            _var_pdn_type = [[UMDiameterAvpPDN_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_pdn_type];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            _var_service_selection = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_selection];
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_Subscribed_QoS_Profile avpCode])
        {
            _var_eps_subscribed_qos_profile = [[UMDiameterAvpEPS_Subscribed_QoS_Profile alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_eps_subscribed_qos_profile];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_Dynamic_Address_Allowed avpCode])
        {
            _var_vplmn_dynamic_address_allowed = [[UMDiameterAvpVPLMN_Dynamic_Address_Allowed alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_vplmn_dynamic_address_allowed];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            _var_mip6_agent_info = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mip6_agent_info];
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            _var_visited_network_identifier = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_network_identifier];
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
    [self setArray:knownAVPs];
}


@end

