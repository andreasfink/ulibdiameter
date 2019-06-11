//
//  UMDiameterPacket3GPP_LRR.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"


@interface UMDiameterPacket3GPP_LRR : UMDiameterPacket
{
    NSString *_session_id;          /* Mandatory */
    NSString *_vendor_specific_application_id;
    NSString *_auth_session_state;  /* Mandatory */
    NSString *_origin_host;         /* Mandatory */
    NSString *_origin_realm;        /* Mandatory */
    NSString *_destination_host;    /* Mandatory */
    NSString *_destination_realm;   /* Mandatory */
    NSString *_location_event;      /* Mandatory */
    NSString *_lcs_eps_client_name;
    NSString *_user_name; /* IMSI*/
    NSString *_msisdn;
    NSString *_imei;
    NSString *_location_estimate;
    NSString *_accuracy_fulfilment_indicator;
    NSString *_age_of_location_estimate;
    NSString *_velocity_estimate;
    NSString *_eutran_positioning_data;
    NSString *_ecgi;
    NSString *_geran_positioning_data;
    NSString *_cell_global_identity;
    NSString *_utran_positioning_info;
    NSString *_service_area_identity;
    NSString *_lcs_service_type_id;
    NSString *_pseudonym_indicator;
    NSString *_lcs_qos_class;
    NSString *_serving_node;
    NSString *_lrr_flags;
    NSString *_lcs_reference_number;
    NSString *_deferred_mt_lr_data;
    NSString *_gmlc_address;
    NSString *_reporting_amount;
    NSString *_periodic_ldr_information;
    NSString *_esmlc_cell_info;
    NSString *_one_x_rtt_rcid;
    NSString *_delayed_location_reporting_data;
    NSString *_civic_address;
    NSString *_barometic_pressure;
    NSString *_supported_features;
    NSArray *_proxy_info;
    NSArray *_route_record;
}


@property(readwrite,strong,atomic)  NSString *session_id; /* Mandatory */
@property(readwrite,strong,atomic)  NSString *vendor_specific_application_id;
@property(readwrite,strong,atomic)  NSString *auth_session_state;  /* Mandatory */
@property(readwrite,strong,atomic)  NSString *origin_host;         /* Mandatory */
@property(readwrite,strong,atomic)  NSString *origin_realm;        /* Mandatory */
@property(readwrite,strong,atomic)  NSString *destination_host;    /* Mandatory */
@property(readwrite,strong,atomic)  NSString *destination_realm;   /* Mandatory */
@property(readwrite,strong,atomic)  NSString *location_event;      /* Mandatory */
@property(readwrite,strong,atomic)  NSString *lcs_eps_client_name;
@property(readwrite,strong,atomic)  NSString *user_name; /* IMSI*/
@property(readwrite,strong,atomic)  NSString *msisdn;
@property(readwrite,strong,atomic)  NSString *imei;
@property(readwrite,strong,atomic)  NSString *location_estimate;
@property(readwrite,strong,atomic)  NSString *accuracy_fulfilment_indicator;
@property(readwrite,strong,atomic)  NSString *age_of_location_estimate;
@property(readwrite,strong,atomic)  NSString *velocity_estimate;
@property(readwrite,strong,atomic)  NSString *eutran_positioning_data;
@property(readwrite,strong,atomic)  NSString *ecgi;
@property(readwrite,strong,atomic)  NSString *geran_positioning_data;
@property(readwrite,strong,atomic)  NSString *cell_global_identity;
@property(readwrite,strong,atomic)  NSString *utran_positioning_info;
@property(readwrite,strong,atomic)  NSString *service_area_identity;
@property(readwrite,strong,atomic)  NSString *lcs_service_type_id;
@property(readwrite,strong,atomic)  NSString *pseudonym_indicator;
@property(readwrite,strong,atomic)  NSString *lcs_qos_class;
@property(readwrite,strong,atomic)  NSString *serving_node;
@property(readwrite,strong,atomic)  NSString *lrr_flags;
@property(readwrite,strong,atomic)  NSString *lcs_reference_number;
@property(readwrite,strong,atomic)  NSString *deferred_mt_lr_data;
@property(readwrite,strong,atomic)  NSString *gmlc_address;
@property(readwrite,strong,atomic)  NSString *reporting_amount;
@property(readwrite,strong,atomic)  NSString *periodic_ldr_information;
@property(readwrite,strong,atomic)  NSString *esmlc_cell_info;
@property(readwrite,strong,atomic)  NSString *one_x_rtt_rcid;
@property(readwrite,strong,atomic)  NSString *delayed_location_reporting_data;
@property(readwrite,strong,atomic)  NSString *civic_address;
@property(readwrite,strong,atomic)  NSString *barometic_pressure;
@property(readwrite,strong,atomic)  NSString *supported_features;
@property(readwrite,strong,atomic)  NSArray *proxy_info;
@property(readwrite,strong,atomic)  NSArray *route_record;

@end
