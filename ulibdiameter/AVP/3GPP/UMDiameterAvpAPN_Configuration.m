//
//  UMDiameterAvpAPN_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_context_identifier)
    {
        [arr addObject:_context_identifier]
    }
    if(_served_party_ip_address.count > 0)
    {
        for(UMDiameterAvpServed_Party_IP_Address *o in _served_party_ip_address)
        {
            [arr addObject:o]
        }
    }
    if(_pdn_type)
    {
        [arr addObject:_pdn_type]
    }
    if(_service_selection)
    {
        [arr addObject:_service_selection]
    }
    if(_eps_subscribed_qos_profile)
    {
        [arr addObject:_eps_subscribed_qos_profile]
    }
    if(_vplmn_dynamic_address_allowed)
    {
        [arr addObject:_vplmn_dynamic_address_allowed]
    }
    if(_mip6_agent_info)
    {
        [arr addObject:_mip6_agent_info]
    }
    if(_visited_network_identifier)
    {
        [arr addObject:_visited_network_identifier]
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            avp = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            _context_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpServed_Party_IP_Address avpCode])
        {
            avp = [[UMDiameterAvpServed_Party_IP_Address alloc]initWithAvp:avp];
            _served_party_ip_address = avp;
            [knownAVPs addObject:avp];
            if(_served_party_ip_address == NULL)
            {
                _served_party_ip_address = @[avp];
            }
            else
            {
                _served_party_ip_address = [_served_party_ip_address arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpPDN_Type avpCode])
        {
            avp = [[UMDiameterAvpPDN_Type alloc]initWithAvp:avp];
            _pdn_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            avp = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _service_selection = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpEPS_Subscribed_QoS_Profile avpCode])
        {
            avp = [[UMDiameterAvpEPS_Subscribed_QoS_Profile alloc]initWithAvp:avp];
            _eps_subscribed_qos_profile = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_Dynamic_Address_Allowed avpCode])
        {
            avp = [[UMDiameterAvpVPLMN_Dynamic_Address_Allowed alloc]initWithAvp:avp];
            _vplmn_dynamic_address_allowed = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpMIP6_Agent_Info avpCode])
        {
            avp = [[UMDiameterAvpMIP6_Agent_Info alloc]initWithAvp:avp];
            _mip6_agent_info = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_Network_Identifier avpCode])
        {
            avp = [[UMDiameterAvpVisited_Network_Identifier alloc]initWithAvp:avp];
            _visited_network_identifier = avp;
            [knownAVPs addObject:avp];
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

