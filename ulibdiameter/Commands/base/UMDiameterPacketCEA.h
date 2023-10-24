//
//  UMDiameterPacketCEA.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:25:22.422409
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpResult_Code;
@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpHost_IP_Address;
@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpProduct_Name;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpError_Message;
@class UMDiameterAvpFailed_AVP;
@class UMDiameterAvpSupported_Vendor_Id;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpInband_Security_Id;
@class UMDiameterAvpAcct_Application_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpFirmware_Revision;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketCEA : UMDiameterPacket
{
	UMDiameterAvpResult_Code	*_var_result_code;
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	NSArray<UMDiameterAvpHost_IP_Address *>	*_var_host_ip_address;
	UMDiameterAvpVendor_Id	*_var_vendor_id;
	UMDiameterAvpProduct_Name	*_var_product_name;
	UMDiameterAvpOrigin_State_Id	*_var_origin_state_id;
	UMDiameterAvpError_Message	*_var_error_message;
	UMDiameterAvpFailed_AVP	*_var_failed_avp;
	NSArray<UMDiameterAvpSupported_Vendor_Id *>	*_var_supported_vendor_id;
	NSArray<UMDiameterAvpAuth_Application_Id *>	*_var_auth_application_id;
	NSArray<UMDiameterAvpInband_Security_Id *>	*_var_inband_security_id;
	NSArray<UMDiameterAvpAcct_Application_Id *>	*_var_acct_application_id;
	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*_var_vendor_specific_application_id;
	UMDiameterAvpFirmware_Revision	*_var_firmware_revision;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*var_result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpHost_IP_Address *>	*var_host_ip_address;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*var_vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpProduct_Name	*var_product_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*var_origin_state_id;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*var_error_message;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*var_failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Vendor_Id *>	*var_supported_vendor_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAuth_Application_Id *>	*var_auth_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpInband_Security_Id *>	*var_inband_security_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAcct_Application_Id *>	*var_acct_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpFirmware_Revision	*var_firmware_revision;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

+ (uint32_t)commandCode;
+ (uint32_t)defaultApplicationId;
+ (void)webDiameterParameters:(NSMutableString *)str;
- (void)afterDecode;
+ (NSString *)webJsonDefintion;
@end

