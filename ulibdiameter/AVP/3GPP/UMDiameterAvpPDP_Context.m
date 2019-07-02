//
//  UMDiameterAvpPDP_Context.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDP_Context.h"

@implementation UMDiameterAvpPDP_Context


- (NSString *)avpType
{
    return @"PDP-Context";
}

- (uint32_t)avpCode
{
    return 1469;
}

+ (uint32_t)avpCode
{
    return 1469;
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
    if(_var_pdp_type)
    {
        [arr addObject:_var_pdp_type];
    }
    if(_var_pdp_address)
    {
        [arr addObject:_var_pdp_address];
    }
    if(_var_qos_subscribed)
    {
        [arr addObject:_var_qos_subscribed];
    }
    if(_var_vplmn_dynamic_address_allowed)
    {
        [arr addObject:_var_vplmn_dynamic_address_allowed];
    }
    if(_var_service_selection)
    {
        [arr addObject:_var_service_selection];
    }
    if(_var_3gpp_charging_characteristics)
    {
        [arr addObject:_var_3gpp_charging_characteristics];
    }
    if(_var_ext_pdp_type)
    {
        [arr addObject:_var_ext_pdp_type];
    }
    if(_var_ext_pdp_address)
    {
        [arr addObject:_var_ext_pdp_address];
    }
    if(_var_ambr)
    {
        [arr addObject:_var_ambr];
    }
    if(_var_apn_oi_replacement)
    {
        [arr addObject:_var_apn_oi_replacement];
    }
    if(_var_sipto_permission)
    {
        [arr addObject:_var_sipto_permission];
    }
    if(_var_lipa_permission)
    {
        [arr addObject:_var_lipa_permission];
    }
    if(_var_restoration_priority)
    {
        [arr addObject:_var_restoration_priority];
    }
    if(_var_sipto_local_network_permission)
    {
        [arr addObject:_var_sipto_local_network_permission];
    }
    if(_var_non_ip_data_delivery_mechanism)
    {
        [arr addObject:_var_non_ip_data_delivery_mechanism];
    }
    if(_var_scef_id)
    {
        [arr addObject:_var_scef_id];
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            avp = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            _var_context_identifier = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpPDP_Type avpCode])
        {
            avp = [[UMDiameterAvpPDP_Type alloc]initWithAvp:avp];
            _var_pdp_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpPDP_Address avpCode])
        {
            avp = [[UMDiameterAvpPDP_Address alloc]initWithAvp:avp];
            _var_pdp_address = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpQoS_Subscribed avpCode])
        {
            avp = [[UMDiameterAvpQoS_Subscribed alloc]initWithAvp:avp];
            _var_qos_subscribed = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_Dynamic_Address_Allowed avpCode])
        {
            avp = [[UMDiameterAvpVPLMN_Dynamic_Address_Allowed alloc]initWithAvp:avp];
            _var_vplmn_dynamic_address_allowed = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            avp = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _var_service_selection = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP_Charging_Characteristics avpCode])
        {
            avp = [[UMDiameterAvp3GPP_Charging_Characteristics alloc]initWithAvp:avp];
            _var_3gpp_charging_characteristics = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExt_PDP_Type avpCode])
        {
            avp = [[UMDiameterAvpExt_PDP_Type alloc]initWithAvp:avp];
            _var_ext_pdp_type = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExt_PDP_Address avpCode])
        {
            avp = [[UMDiameterAvpExt_PDP_Address alloc]initWithAvp:avp];
            _var_ext_pdp_address = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAMBR avpCode])
        {
            avp = [[UMDiameterAvpAMBR alloc]initWithAvp:avp];
            _var_ambr = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_OI_Replacement avpCode])
        {
            avp = [[UMDiameterAvpAPN_OI_Replacement alloc]initWithAvp:avp];
            _var_apn_oi_replacement = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSIPTO_Permission avpCode])
        {
            avp = [[UMDiameterAvpSIPTO_Permission alloc]initWithAvp:avp];
            _var_sipto_permission = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLIPA_Permission avpCode])
        {
            avp = [[UMDiameterAvpLIPA_Permission alloc]initWithAvp:avp];
            _var_lipa_permission = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRestoration_Priority avpCode])
        {
            avp = [[UMDiameterAvpRestoration_Priority alloc]initWithAvp:avp];
            _var_restoration_priority = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSIPTO_Local_Network_Permission avpCode])
        {
            avp = [[UMDiameterAvpSIPTO_Local_Network_Permission alloc]initWithAvp:avp];
            _var_sipto_local_network_permission = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpNon_IP_Data_Delivery_Mechanism avpCode])
        {
            avp = [[UMDiameterAvpNon_IP_Data_Delivery_Mechanism alloc]initWithAvp:avp];
            _var_non_ip_data_delivery_mechanism = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            avp = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            _var_scef_id = avp;
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

