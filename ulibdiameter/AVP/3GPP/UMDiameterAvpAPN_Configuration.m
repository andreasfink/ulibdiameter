//
//  UMDiameterAvpAPN_Configuration.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

