//
//  UMDiameterAvpPDP_Context.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:06:47.188000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpPDP_Context.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpPDP_Type.h"
#import "UMDiameterAvpPDP_Address.h"
#import "UMDiameterAvpQoS_Subscribed.h"
#import "UMDiameterAvpVPLMN_Dynamic_Address_Allowed.h"
#import "UMDiameterAvpService_Selection.h"
#import "UMDiameterAvp3GPP_Charging_Characteristics.h"
#import "UMDiameterAvpExt_PDP_Type.h"
#import "UMDiameterAvpExt_PDP_Address.h"
#import "UMDiameterAvpAMBR.h"
#import "UMDiameterAvpAPN_OI_Replacement.h"
#import "UMDiameterAvpSIPTO_Permission.h"
#import "UMDiameterAvpLIPA_Permission.h"
#import "UMDiameterAvpRestoration_Priority.h"
#import "UMDiameterAvpSIPTO_Local_Network_Permission.h"
#import "UMDiameterAvpNon_IP_Data_Delivery_Mechanism.h"
#import "UMDiameterAvpSCEF_ID.h"
#import "UMDiameterAvpAVP.h"

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

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            _var_context_identifier = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_context_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpPDP_Type avpCode])
        {
            _var_pdp_type = [[UMDiameterAvpPDP_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_pdp_type];
        }
        else if(avp.avpCode == [UMDiameterAvpPDP_Address avpCode])
        {
            _var_pdp_address = [[UMDiameterAvpPDP_Address alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_pdp_address];
        }
        else if(avp.avpCode == [UMDiameterAvpQoS_Subscribed avpCode])
        {
            _var_qos_subscribed = [[UMDiameterAvpQoS_Subscribed alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_qos_subscribed];
        }
        else if(avp.avpCode == [UMDiameterAvpVPLMN_Dynamic_Address_Allowed avpCode])
        {
            _var_vplmn_dynamic_address_allowed = [[UMDiameterAvpVPLMN_Dynamic_Address_Allowed alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_vplmn_dynamic_address_allowed];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            _var_service_selection = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_selection];
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP_Charging_Characteristics avpCode])
        {
            _var_3gpp_charging_characteristics = [[UMDiameterAvp3GPP_Charging_Characteristics alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_3gpp_charging_characteristics];
        }
        else if(avp.avpCode == [UMDiameterAvpExt_PDP_Type avpCode])
        {
            _var_ext_pdp_type = [[UMDiameterAvpExt_PDP_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ext_pdp_type];
        }
        else if(avp.avpCode == [UMDiameterAvpExt_PDP_Address avpCode])
        {
            _var_ext_pdp_address = [[UMDiameterAvpExt_PDP_Address alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ext_pdp_address];
        }
        else if(avp.avpCode == [UMDiameterAvpAMBR avpCode])
        {
            _var_ambr = [[UMDiameterAvpAMBR alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ambr];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_OI_Replacement avpCode])
        {
            _var_apn_oi_replacement = [[UMDiameterAvpAPN_OI_Replacement alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_apn_oi_replacement];
        }
        else if(avp.avpCode == [UMDiameterAvpSIPTO_Permission avpCode])
        {
            _var_sipto_permission = [[UMDiameterAvpSIPTO_Permission alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sipto_permission];
        }
        else if(avp.avpCode == [UMDiameterAvpLIPA_Permission avpCode])
        {
            _var_lipa_permission = [[UMDiameterAvpLIPA_Permission alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_lipa_permission];
        }
        else if(avp.avpCode == [UMDiameterAvpRestoration_Priority avpCode])
        {
            _var_restoration_priority = [[UMDiameterAvpRestoration_Priority alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_restoration_priority];
        }
        else if(avp.avpCode == [UMDiameterAvpSIPTO_Local_Network_Permission avpCode])
        {
            _var_sipto_local_network_permission = [[UMDiameterAvpSIPTO_Local_Network_Permission alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sipto_local_network_permission];
        }
        else if(avp.avpCode == [UMDiameterAvpNon_IP_Data_Delivery_Mechanism avpCode])
        {
            _var_non_ip_data_delivery_mechanism = [[UMDiameterAvpNon_IP_Data_Delivery_Mechanism alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_non_ip_data_delivery_mechanism];
        }
        else if(avp.avpCode == [UMDiameterAvpSCEF_ID avpCode])
        {
            _var_scef_id = [[UMDiameterAvpSCEF_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_scef_id];
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

