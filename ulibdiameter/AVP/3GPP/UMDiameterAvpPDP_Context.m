//
//  UMDiameterAvpPDP_Context.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

