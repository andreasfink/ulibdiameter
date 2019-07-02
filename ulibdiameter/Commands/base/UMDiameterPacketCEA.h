//
//  UMDiameterPacketCEA.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.309000
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
	UMDiameterAvpResult_Code	*_varresult_code;
	UMDiameterAvpOrigin_Host	*_varorigin_host;
	UMDiameterAvpOrigin_Realm	*_varorigin_realm;
	NSArray<UMDiameterAvpHost_IP_Address *>	*_varhost_ip_address;
	UMDiameterAvpVendor_Id	*_varvendor_id;
	UMDiameterAvpProduct_Name	*_varproduct_name;
	UMDiameterAvpOrigin_State_Id	*_varorigin_state_id;
	UMDiameterAvpError_Message	*_varerror_message;
	UMDiameterAvpFailed_AVP	*_varfailed_avp;
	NSArray<UMDiameterAvpSupported_Vendor_Id *>	*_varsupported_vendor_id;
	NSArray<UMDiameterAvpAuth_Application_Id *>	*_varauth_application_id;
	NSArray<UMDiameterAvpInband_Security_Id *>	*_varinband_security_id;
	NSArray<UMDiameterAvpAcct_Application_Id *>	*_varacct_application_id;
	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*_varvendor_specific_application_id;
	UMDiameterAvpFirmware_Revision	*_varfirmware_revision;
	NSArray<UMDiameterAvpAVP *>	*_varavp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpResult_Code	*result_code;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*origin_realm;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpHost_IP_Address *>	*host_ip_address;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpProduct_Name	*product_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*origin_state_id;
@property(readwrite,strong,atomic)	UMDiameterAvpError_Message	*error_message;
@property(readwrite,strong,atomic)	UMDiameterAvpFailed_AVP	*failed_avp;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Vendor_Id *>	*supported_vendor_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAuth_Application_Id *>	*auth_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpInband_Security_Id *>	*inband_security_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAcct_Application_Id *>	*acct_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*vendor_specific_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpFirmware_Revision	*firmware_revision;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

@end

