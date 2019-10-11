//
//  UMDiameterPacketLocation_Report_Request.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 06:37:27.377000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketLocation_Report_Request.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAuth_Session_State.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDestination_Host.h"
#import "UMDiameterAvpDestination_Realm.h"
#import "UMDiameterAvpLocation_Event.h"
#import "UMDiameterAvpLCS_EPS_Client_Name.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpMSISDN.h"
#import "UMDiameterAvpIMEI.h"
#import "UMDiameterAvpLocation_Estimate.h"
#import "UMDiameterAvpAccuracy_Fulfilment_Indicator.h"
#import "UMDiameterAvpAge_Of_Location_Estimate.h"
#import "UMDiameterAvpVelocity_Estimate.h"
#import "UMDiameterAvpEUTRAN_Positioning_Data.h"
#import "UMDiameterAvpECGI.h"
#import "UMDiameterAvpGERAN_Positioning_Info.h"
#import "UMDiameterAvpCell_Global_Identity.h"
#import "UMDiameterAvpUTRAN_Positioning_Info.h"
#import "UMDiameterAvpService_Area_Identity.h"
#import "UMDiameterAvpLCS_Service_Type_ID.h"
#import "UMDiameterAvpPseudonym_Indicator.h"
#import "UMDiameterAvpLCS_QoS_Class.h"
#import "UMDiameterAvpServing_Node.h"
#import "UMDiameterAvpLRR_Flags.h"
#import "UMDiameterAvpLCS_Reference_Number.h"
#import "UMDiameterAvpDeferred_MT_LR_Data.h"
#import "UMDiameterAvpGMLC_Address.h"
#import "UMDiameterAvpReporting_Amount.h"
#import "UMDiameterAvpPeriodic_LDR_Information.h"
#import "UMDiameterAvpESMLC_Cell_Info.h"
#import "UMDiameterAvp1xRTT_RCID.h"
#import "UMDiameterAvpDelayed_Location_Reporting_Data.h"
#import "UMDiameterAvpCivic_Address.h"
#import "UMDiameterAvpBarometric_Pressure.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpAVP.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpRoute_Record.h"

@implementation UMDiameterPacketLocation_Report_Request


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 8388621;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
}

+ (uint32_t)commandCode
{
    return 8388621;
}

+ (uint32_t)defaultApplicationId
{
    return 16777255;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_session_id)
    {
        [arr addObject:_var_session_id];
    }
    if(_var_vendor_specific_application_id)
    {
        [arr addObject:_var_vendor_specific_application_id];
    }
    if(_var_auth_session_state)
    {
        [arr addObject:_var_auth_session_state];
    }
    if(_var_origin_host)
    {
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [arr addObject:_var_origin_realm];
    }
    if(_var_destination_host)
    {
        [arr addObject:_var_destination_host];
    }
    if(_var_destination_realm)
    {
        [arr addObject:_var_destination_realm];
    }
    if(_var_location_event)
    {
        [arr addObject:_var_location_event];
    }
    if(_var_lcs_eps_client_name)
    {
        [arr addObject:_var_lcs_eps_client_name];
    }
    if(_var_user_name)
    {
        [arr addObject:_var_user_name];
    }
    if(_var_msisdn)
    {
        [arr addObject:_var_msisdn];
    }
    if(_var_imei)
    {
        [arr addObject:_var_imei];
    }
    if(_var_location_estimate)
    {
        [arr addObject:_var_location_estimate];
    }
    if(_var_accuracy_fulfilment_indicator)
    {
        [arr addObject:_var_accuracy_fulfilment_indicator];
    }
    if(_var_age_of_location_estimate)
    {
        [arr addObject:_var_age_of_location_estimate];
    }
    if(_var_velocity_estimate)
    {
        [arr addObject:_var_velocity_estimate];
    }
    if(_var_eutran_positioning_data)
    {
        [arr addObject:_var_eutran_positioning_data];
    }
    if(_var_ecgi)
    {
        [arr addObject:_var_ecgi];
    }
    if(_var_geran_positioning_info)
    {
        [arr addObject:_var_geran_positioning_info];
    }
    if(_var_cell_global_identity)
    {
        [arr addObject:_var_cell_global_identity];
    }
    if(_var_utran_positioning_info)
    {
        [arr addObject:_var_utran_positioning_info];
    }
    if(_var_service_area_identity)
    {
        [arr addObject:_var_service_area_identity];
    }
    if(_var_lcs_service_type_id)
    {
        [arr addObject:_var_lcs_service_type_id];
    }
    if(_var_pseudonym_indicator)
    {
        [arr addObject:_var_pseudonym_indicator];
    }
    if(_var_lcs_qos_class)
    {
        [arr addObject:_var_lcs_qos_class];
    }
    if(_var_serving_node)
    {
        [arr addObject:_var_serving_node];
    }
    if(_var_lrr_flags)
    {
        [arr addObject:_var_lrr_flags];
    }
    if(_var_lcs_reference_number)
    {
        [arr addObject:_var_lcs_reference_number];
    }
    if(_var_deferred_mt_lr_data)
    {
        [arr addObject:_var_deferred_mt_lr_data];
    }
    if(_var_gmlc_address)
    {
        [arr addObject:_var_gmlc_address];
    }
    if(_var_reporting_amount)
    {
        [arr addObject:_var_reporting_amount];
    }
    if(_var_periodic_ldr_information)
    {
        [arr addObject:_var_periodic_ldr_information];
    }
    if(_var_esmlc_cell_info)
    {
        [arr addObject:_var_esmlc_cell_info];
    }
    if(_var_1xrtt_rcid)
    {
        [arr addObject:_var_1xrtt_rcid];
    }
    if(_var_delayed_location_reporting_data)
    {
        [arr addObject:_var_delayed_location_reporting_data];
    }
    if(_var_civic_address)
    {
        [arr addObject:_var_civic_address];
    }
    if(_var_barometric_pressure)
    {
        [arr addObject:_var_barometric_pressure];
    }
    if(_var_supported_features.count > 0)
    {
        for(UMDiameterAvpSupported_Features *o in _var_supported_features)
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
    if(_var_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _var_proxy_info)
        {
            [arr addObject:o];
        }
    }
    if(_var_route_record.count > 0)
    {
        for(UMDiameterAvpRoute_Record *o in _var_route_record)
        {
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


- (void)setDictionaryValue:(NSDictionary *)dict
{

    if(dict[@"session-id"])
    {
        _var_session_id = [[UMDiameterAvpSession_Id alloc]init];
        _var_session_id.objectValue = dict[@"session-id"];
    }

    if(dict[@"vendor-specific-application-id"])
    {
        _var_vendor_specific_application_id = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
        _var_vendor_specific_application_id.objectValue = dict[@"vendor-specific-application-id"];
    }

    if(dict[@"auth-session-state"])
    {
        _var_auth_session_state = [[UMDiameterAvpAuth_Session_State alloc]init];
        _var_auth_session_state.objectValue = dict[@"auth-session-state"];
    }

    if(dict[@"origin-host"])
    {
        _var_origin_host = [[UMDiameterAvpOrigin_Host alloc]init];
        _var_origin_host.objectValue = dict[@"origin-host"];
    }

    if(dict[@"origin-realm"])
    {
        _var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]init];
        _var_origin_realm.objectValue = dict[@"origin-realm"];
    }

    if(dict[@"destination-host"])
    {
        _var_destination_host = [[UMDiameterAvpDestination_Host alloc]init];
        _var_destination_host.objectValue = dict[@"destination-host"];
    }

    if(dict[@"destination-realm"])
    {
        _var_destination_realm = [[UMDiameterAvpDestination_Realm alloc]init];
        _var_destination_realm.objectValue = dict[@"destination-realm"];
    }

    if(dict[@"location-event"])
    {
        _var_location_event = [[UMDiameterAvpLocation_Event alloc]init];
        _var_location_event.objectValue = dict[@"location-event"];
    }

    if(dict[@"lcs-eps-client-name"])
    {
        _var_lcs_eps_client_name = [[UMDiameterAvpLCS_EPS_Client_Name alloc]init];
        _var_lcs_eps_client_name.objectValue = dict[@"lcs-eps-client-name"];
    }

    if(dict[@"user-name"])
    {
        _var_user_name = [[UMDiameterAvpUser_Name alloc]init];
        _var_user_name.objectValue = dict[@"user-name"];
    }

    if(dict[@"msisdn"])
    {
        _var_msisdn = [[UMDiameterAvpMSISDN alloc]init];
        _var_msisdn.objectValue = dict[@"msisdn"];
    }

    if(dict[@"imei"])
    {
        _var_imei = [[UMDiameterAvpIMEI alloc]init];
        _var_imei.objectValue = dict[@"imei"];
    }

    if(dict[@"location-estimate"])
    {
        _var_location_estimate = [[UMDiameterAvpLocation_Estimate alloc]init];
        _var_location_estimate.objectValue = dict[@"location-estimate"];
    }

    if(dict[@"accuracy-fulfilment-indicator"])
    {
        _var_accuracy_fulfilment_indicator = [[UMDiameterAvpAccuracy_Fulfilment_Indicator alloc]init];
        _var_accuracy_fulfilment_indicator.objectValue = dict[@"accuracy-fulfilment-indicator"];
    }

    if(dict[@"age-of-location-estimate"])
    {
        _var_age_of_location_estimate = [[UMDiameterAvpAge_Of_Location_Estimate alloc]init];
        _var_age_of_location_estimate.objectValue = dict[@"age-of-location-estimate"];
    }

    if(dict[@"velocity-estimate"])
    {
        _var_velocity_estimate = [[UMDiameterAvpVelocity_Estimate alloc]init];
        _var_velocity_estimate.objectValue = dict[@"velocity-estimate"];
    }

    if(dict[@"eutran-positioning-data"])
    {
        _var_eutran_positioning_data = [[UMDiameterAvpEUTRAN_Positioning_Data alloc]init];
        _var_eutran_positioning_data.objectValue = dict[@"eutran-positioning-data"];
    }

    if(dict[@"ecgi"])
    {
        _var_ecgi = [[UMDiameterAvpECGI alloc]init];
        _var_ecgi.objectValue = dict[@"ecgi"];
    }

    if(dict[@"geran-positioning-info"])
    {
        _var_geran_positioning_info = [[UMDiameterAvpGERAN_Positioning_Info alloc]init];
        _var_geran_positioning_info.objectValue = dict[@"geran-positioning-info"];
    }

    if(dict[@"cell-global-identity"])
    {
        _var_cell_global_identity = [[UMDiameterAvpCell_Global_Identity alloc]init];
        _var_cell_global_identity.objectValue = dict[@"cell-global-identity"];
    }

    if(dict[@"utran-positioning-info"])
    {
        _var_utran_positioning_info = [[UMDiameterAvpUTRAN_Positioning_Info alloc]init];
        _var_utran_positioning_info.objectValue = dict[@"utran-positioning-info"];
    }

    if(dict[@"service-area-identity"])
    {
        _var_service_area_identity = [[UMDiameterAvpService_Area_Identity alloc]init];
        _var_service_area_identity.objectValue = dict[@"service-area-identity"];
    }

    if(dict[@"lcs-service-type-id"])
    {
        _var_lcs_service_type_id = [[UMDiameterAvpLCS_Service_Type_ID alloc]init];
        _var_lcs_service_type_id.objectValue = dict[@"lcs-service-type-id"];
    }

    if(dict[@"pseudonym-indicator"])
    {
        _var_pseudonym_indicator = [[UMDiameterAvpPseudonym_Indicator alloc]init];
        _var_pseudonym_indicator.objectValue = dict[@"pseudonym-indicator"];
    }

    if(dict[@"lcs-qos-class"])
    {
        _var_lcs_qos_class = [[UMDiameterAvpLCS_QoS_Class alloc]init];
        _var_lcs_qos_class.objectValue = dict[@"lcs-qos-class"];
    }

    if(dict[@"serving-node"])
    {
        _var_serving_node = [[UMDiameterAvpServing_Node alloc]init];
        _var_serving_node.objectValue = dict[@"serving-node"];
    }

    if(dict[@"lrr-flags"])
    {
        _var_lrr_flags = [[UMDiameterAvpLRR_Flags alloc]init];
        _var_lrr_flags.objectValue = dict[@"lrr-flags"];
    }

    if(dict[@"lcs-reference-number"])
    {
        _var_lcs_reference_number = [[UMDiameterAvpLCS_Reference_Number alloc]init];
        _var_lcs_reference_number.objectValue = dict[@"lcs-reference-number"];
    }

    if(dict[@"deferred-mt-lr-data"])
    {
        _var_deferred_mt_lr_data = [[UMDiameterAvpDeferred_MT_LR_Data alloc]init];
        _var_deferred_mt_lr_data.objectValue = dict[@"deferred-mt-lr-data"];
    }

    if(dict[@"gmlc-address"])
    {
        _var_gmlc_address = [[UMDiameterAvpGMLC_Address alloc]init];
        _var_gmlc_address.objectValue = dict[@"gmlc-address"];
    }

    if(dict[@"reporting-amount"])
    {
        _var_reporting_amount = [[UMDiameterAvpReporting_Amount alloc]init];
        _var_reporting_amount.objectValue = dict[@"reporting-amount"];
    }

    if(dict[@"periodic-ldr-information"])
    {
        _var_periodic_ldr_information = [[UMDiameterAvpPeriodic_LDR_Information alloc]init];
        _var_periodic_ldr_information.objectValue = dict[@"periodic-ldr-information"];
    }

    if(dict[@"esmlc-cell-info"])
    {
        _var_esmlc_cell_info = [[UMDiameterAvpESMLC_Cell_Info alloc]init];
        _var_esmlc_cell_info.objectValue = dict[@"esmlc-cell-info"];
    }

    if(dict[@"1xrtt-rcid"])
    {
        _var_1xrtt_rcid = [[UMDiameterAvp1xRTT_RCID alloc]init];
        _var_1xrtt_rcid.objectValue = dict[@"1xrtt-rcid"];
    }

    if(dict[@"delayed-location-reporting-data"])
    {
        _var_delayed_location_reporting_data = [[UMDiameterAvpDelayed_Location_Reporting_Data alloc]init];
        _var_delayed_location_reporting_data.objectValue = dict[@"delayed-location-reporting-data"];
    }

    if(dict[@"civic-address"])
    {
        _var_civic_address = [[UMDiameterAvpCivic_Address alloc]init];
        _var_civic_address.objectValue = dict[@"civic-address"];
    }

    if(dict[@"barometric-pressure"])
    {
        _var_barometric_pressure = [[UMDiameterAvpBarometric_Pressure alloc]init];
        _var_barometric_pressure.objectValue = dict[@"barometric-pressure"];
    }

    if(dict[@"supported-features"])
    {
        id obj = dict[@"supported-features"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpSupported_Features *o = [[UMDiameterAvpSupported_Features alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_supported_features = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpSupported_Features *o = [[UMDiameterAvpSupported_Features alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_supported_features = arr;
        }
    }
    if(dict[@"avp"])
    {
        id obj = dict[@"avp"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_avp = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_avp = arr;
        }
    }
    if(dict[@"proxy-info"])
    {
        id obj = dict[@"proxy-info"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpProxy_Info *o = [[UMDiameterAvpProxy_Info alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_proxy_info = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpProxy_Info *o = [[UMDiameterAvpProxy_Info alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_proxy_info = arr;
        }
    }
    if(dict[@"route-record"])
    {
        id obj = dict[@"route-record"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpRoute_Record *o = [[UMDiameterAvpRoute_Record alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_route_record = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpRoute_Record *o = [[UMDiameterAvpRoute_Record alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_route_record = arr;
        }
    }
}

- (UMSynchronizedSortedDictionary *)dictionaryValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_var_session_id)
    {
        dict[@"session-id"] = _var_session_id.objectValue;
    }
    if(_var_vendor_specific_application_id)
    {
        dict[@"vendor-specific-application-id"] = _var_vendor_specific_application_id.objectValue;
    }
    if(_var_auth_session_state)
    {
        dict[@"auth-session-state"] = _var_auth_session_state.objectValue;
    }
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_destination_host)
    {
        dict[@"destination-host"] = _var_destination_host.objectValue;
    }
    if(_var_destination_realm)
    {
        dict[@"destination-realm"] = _var_destination_realm.objectValue;
    }
    if(_var_location_event)
    {
        dict[@"location-event"] = _var_location_event.objectValue;
    }
    if(_var_lcs_eps_client_name)
    {
        dict[@"lcs-eps-client-name"] = _var_lcs_eps_client_name.objectValue;
    }
    if(_var_user_name)
    {
        dict[@"user-name"] = _var_user_name.objectValue;
    }
    if(_var_msisdn)
    {
        dict[@"msisdn"] = _var_msisdn.objectValue;
    }
    if(_var_imei)
    {
        dict[@"imei"] = _var_imei.objectValue;
    }
    if(_var_location_estimate)
    {
        dict[@"location-estimate"] = _var_location_estimate.objectValue;
    }
    if(_var_accuracy_fulfilment_indicator)
    {
        dict[@"accuracy-fulfilment-indicator"] = _var_accuracy_fulfilment_indicator.objectValue;
    }
    if(_var_age_of_location_estimate)
    {
        dict[@"age-of-location-estimate"] = _var_age_of_location_estimate.objectValue;
    }
    if(_var_velocity_estimate)
    {
        dict[@"velocity-estimate"] = _var_velocity_estimate.objectValue;
    }
    if(_var_eutran_positioning_data)
    {
        dict[@"eutran-positioning-data"] = _var_eutran_positioning_data.objectValue;
    }
    if(_var_ecgi)
    {
        dict[@"ecgi"] = _var_ecgi.objectValue;
    }
    if(_var_geran_positioning_info)
    {
        dict[@"geran-positioning-info"] = _var_geran_positioning_info.objectValue;
    }
    if(_var_cell_global_identity)
    {
        dict[@"cell-global-identity"] = _var_cell_global_identity.objectValue;
    }
    if(_var_utran_positioning_info)
    {
        dict[@"utran-positioning-info"] = _var_utran_positioning_info.objectValue;
    }
    if(_var_service_area_identity)
    {
        dict[@"service-area-identity"] = _var_service_area_identity.objectValue;
    }
    if(_var_lcs_service_type_id)
    {
        dict[@"lcs-service-type-id"] = _var_lcs_service_type_id.objectValue;
    }
    if(_var_pseudonym_indicator)
    {
        dict[@"pseudonym-indicator"] = _var_pseudonym_indicator.objectValue;
    }
    if(_var_lcs_qos_class)
    {
        dict[@"lcs-qos-class"] = _var_lcs_qos_class.objectValue;
    }
    if(_var_serving_node)
    {
        dict[@"serving-node"] = _var_serving_node.objectValue;
    }
    if(_var_lrr_flags)
    {
        dict[@"lrr-flags"] = _var_lrr_flags.objectValue;
    }
    if(_var_lcs_reference_number)
    {
        dict[@"lcs-reference-number"] = _var_lcs_reference_number.objectValue;
    }
    if(_var_deferred_mt_lr_data)
    {
        dict[@"deferred-mt-lr-data"] = _var_deferred_mt_lr_data.objectValue;
    }
    if(_var_gmlc_address)
    {
        dict[@"gmlc-address"] = _var_gmlc_address.objectValue;
    }
    if(_var_reporting_amount)
    {
        dict[@"reporting-amount"] = _var_reporting_amount.objectValue;
    }
    if(_var_periodic_ldr_information)
    {
        dict[@"periodic-ldr-information"] = _var_periodic_ldr_information.objectValue;
    }
    if(_var_esmlc_cell_info)
    {
        dict[@"esmlc-cell-info"] = _var_esmlc_cell_info.objectValue;
    }
    if(_var_1xrtt_rcid)
    {
        dict[@"1xrtt-rcid"] = _var_1xrtt_rcid.objectValue;
    }
    if(_var_delayed_location_reporting_data)
    {
        dict[@"delayed-location-reporting-data"] = _var_delayed_location_reporting_data.objectValue;
    }
    if(_var_civic_address)
    {
        dict[@"civic-address"] = _var_civic_address.objectValue;
    }
    if(_var_barometric_pressure)
    {
        dict[@"barometric-pressure"] = _var_barometric_pressure.objectValue;
    }
    if(_var_supported_features)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_supported_features)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"supported-features"] = arr;
    }
    if(_var_avp)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_avp)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"avp"] = arr;
    }
    if(_var_proxy_info)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_proxy_info)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"proxy-info"] = arr;
    }
    if(_var_route_record)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_route_record)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"route-record"] = arr;
    }
    return dict;
}

+ (void)webDiameterParameters:(NSMutableString *)s
{


    [UMDiameterAvpSession_Id appendWebDiameterParameters:s webName:@"session-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Session_State appendWebDiameterParameters:s webName:@"auth-session-state"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Host appendWebDiameterParameters:s webName:@"destination-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpDestination_Realm appendWebDiameterParameters:s webName:@"destination-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpLocation_Event appendWebDiameterParameters:s webName:@"location-event"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpLCS_EPS_Client_Name appendWebDiameterParameters:s webName:@"lcs-eps-client-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpUser_Name appendWebDiameterParameters:s webName:@"user-name"  comment:@"" css:@"optional"];

    [UMDiameterAvpMSISDN appendWebDiameterParameters:s webName:@"msisdn"  comment:@"" css:@"optional"];

    [UMDiameterAvpIMEI appendWebDiameterParameters:s webName:@"imei"  comment:@"" css:@"optional"];

    [UMDiameterAvpLocation_Estimate appendWebDiameterParameters:s webName:@"location-estimate"  comment:@"" css:@"optional"];

    [UMDiameterAvpAccuracy_Fulfilment_Indicator appendWebDiameterParameters:s webName:@"accuracy-fulfilment-indicator"  comment:@"" css:@"optional"];

    [UMDiameterAvpAge_Of_Location_Estimate appendWebDiameterParameters:s webName:@"age-of-location-estimate"  comment:@"" css:@"optional"];

    [UMDiameterAvpVelocity_Estimate appendWebDiameterParameters:s webName:@"velocity-estimate"  comment:@"" css:@"optional"];

    [UMDiameterAvpEUTRAN_Positioning_Data appendWebDiameterParameters:s webName:@"eutran-positioning-data"  comment:@"" css:@"optional"];

    [UMDiameterAvpECGI appendWebDiameterParameters:s webName:@"ecgi"  comment:@"" css:@"optional"];

    [UMDiameterAvpGERAN_Positioning_Info appendWebDiameterParameters:s webName:@"geran-positioning-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpCell_Global_Identity appendWebDiameterParameters:s webName:@"cell-global-identity"  comment:@"" css:@"optional"];

    [UMDiameterAvpUTRAN_Positioning_Info appendWebDiameterParameters:s webName:@"utran-positioning-info"  comment:@"" css:@"optional"];

    [UMDiameterAvpService_Area_Identity appendWebDiameterParameters:s webName:@"service-area-identity"  comment:@"" css:@"optional"];

    [UMDiameterAvpLCS_Service_Type_ID appendWebDiameterParameters:s webName:@"lcs-service-type-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpPseudonym_Indicator appendWebDiameterParameters:s webName:@"pseudonym-indicator"  comment:@"" css:@"optional"];

    [UMDiameterAvpLCS_QoS_Class appendWebDiameterParameters:s webName:@"lcs-qos-class"  comment:@"" css:@"optional"];

    [UMDiameterAvpServing_Node appendWebDiameterParameters:s webName:@"serving-node"  comment:@"" css:@"optional"];

    [UMDiameterAvpLRR_Flags appendWebDiameterParameters:s webName:@"lrr-flags"  comment:@"" css:@"optional"];

    [UMDiameterAvpLCS_Reference_Number appendWebDiameterParameters:s webName:@"lcs-reference-number"  comment:@"" css:@"optional"];

    [UMDiameterAvpDeferred_MT_LR_Data appendWebDiameterParameters:s webName:@"deferred-mt-lr-data"  comment:@"" css:@"optional"];

    [UMDiameterAvpGMLC_Address appendWebDiameterParameters:s webName:@"gmlc-address"  comment:@"" css:@"optional"];

    [UMDiameterAvpReporting_Amount appendWebDiameterParameters:s webName:@"reporting-amount"  comment:@"" css:@"optional"];

    [UMDiameterAvpPeriodic_LDR_Information appendWebDiameterParameters:s webName:@"periodic-ldr-information"  comment:@"" css:@"optional"];

    [UMDiameterAvpESMLC_Cell_Info appendWebDiameterParameters:s webName:@"esmlc-cell-info"  comment:@"" css:@"optional"];

    [UMDiameterAvp1xRTT_RCID appendWebDiameterParameters:s webName:@"1xrtt-rcid"  comment:@"" css:@"optional"];

    [UMDiameterAvpDelayed_Location_Reporting_Data appendWebDiameterParameters:s webName:@"delayed-location-reporting-data"  comment:@"" css:@"optional"];

    [UMDiameterAvpCivic_Address appendWebDiameterParameters:s webName:@"civic-address"  comment:@"" css:@"optional"];

    [UMDiameterAvpBarometric_Pressure appendWebDiameterParameters:s webName:@"barometric-pressure"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Features appendWebDiameterParameters:s webName:@"supported-features[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpProxy_Info appendWebDiameterParameters:s webName:@"proxy-info[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpRoute_Record appendWebDiameterParameters:s webName:@"route-record[]"  comment:@"" css:@"optional"];

}

@end

