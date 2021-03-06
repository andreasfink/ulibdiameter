//
//  UMDiameterPacketCUR.h
//  ulibdiameter
//
//  Created by afink on 2021-03-02 21:30:27.341634
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacket.h"

@class UMDiameterAvpOrigin_Host;
@class UMDiameterAvpOrigin_Realm;
@class UMDiameterAvpHost_IP_Address;
@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpProduct_Name;
@class UMDiameterAvpOrigin_State_Id;
@class UMDiameterAvpSupported_Vendor_Id;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpAcct_Application_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpFirmware_Revision;
@class UMDiameterAvpAVP;
@interface UMDiameterPacketCUR : UMDiameterPacket
{
	UMDiameterAvpOrigin_Host	*_var_origin_host;
	UMDiameterAvpOrigin_Realm	*_var_origin_realm;
	NSArray<UMDiameterAvpHost_IP_Address *>	*_var_host_ip_address;
	UMDiameterAvpVendor_Id	*_var_vendor_id;
	UMDiameterAvpProduct_Name	*_var_product_name;
	UMDiameterAvpOrigin_State_Id	*_var_origin_state_id;
	NSArray<UMDiameterAvpSupported_Vendor_Id *>	*_var_supported_vendor_id;
	NSArray<UMDiameterAvpAuth_Application_Id *>	*_var_auth_application_id;
	NSArray<UMDiameterAvpAcct_Application_Id *>	*_var_acct_application_id;
	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*_var_vendor_specific_application_id;
	UMDiameterAvpFirmware_Revision	*_var_firmware_revision;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Host	*var_origin_host;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_Realm	*var_origin_realm;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpHost_IP_Address *>	*var_host_ip_address;
@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*var_vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpProduct_Name	*var_product_name;
@property(readwrite,strong,atomic)	UMDiameterAvpOrigin_State_Id	*var_origin_state_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSupported_Vendor_Id *>	*var_supported_vendor_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAuth_Application_Id *>	*var_auth_application_id;
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

