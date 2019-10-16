//
//  UMDiameterAvpSIP_Auth_Data_Item.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSIP_Item_Number;
@class UMDiameterAvpSIP_Authentication_Scheme;
@class UMDiameterAvpSIP_Authorization;
@class UMDiameterAvpSIP_Authentication_Context;
@class UMDiameterAvpIntegrity_Key;
@class UMDiameterAvpSIP_Digest_Authenticate;
@class UMDiameterAvpFramed_IP_Address;
@class UMDiameterAvpFramed_IPv6_Prefix;
@class UMDiameterAvpFramed_Interface_Id;
@class UMDiameterAvpLine_Identifier;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSIP_Auth_Data_Item : UMDiameterAvpGrouped
{
	UMDiameterAvpSIP_Item_Number	*_var_sip_item_number;
	UMDiameterAvpSIP_Authentication_Scheme	*_var_sip_authentication_scheme;
	UMDiameterAvpSIP_Authorization	*_var_sip_authorization;
	UMDiameterAvpSIP_Authentication_Context	*_var_sip_authentication_context;
	UMDiameterAvpIntegrity_Key	*_var_integrity_key;
	UMDiameterAvpSIP_Digest_Authenticate	*_var_sip_digest_authenticate;
	UMDiameterAvpFramed_IP_Address	*_var_framed_ip_address;
	UMDiameterAvpFramed_IPv6_Prefix	*_var_framed_ipv6_prefix;
	UMDiameterAvpFramed_Interface_Id	*_var_framed_interface_id;
	NSArray<UMDiameterAvpLine_Identifier *>	*_var_line_identifier;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSIP_Item_Number	*var_sip_item_number;
@property(readwrite,strong,atomic)	UMDiameterAvpSIP_Authentication_Scheme	*var_sip_authentication_scheme;
@property(readwrite,strong,atomic)	UMDiameterAvpSIP_Authorization	*var_sip_authorization;
@property(readwrite,strong,atomic)	UMDiameterAvpSIP_Authentication_Context	*var_sip_authentication_context;
@property(readwrite,strong,atomic)	UMDiameterAvpIntegrity_Key	*var_integrity_key;
@property(readwrite,strong,atomic)	UMDiameterAvpSIP_Digest_Authenticate	*var_sip_digest_authenticate;
@property(readwrite,strong,atomic)	UMDiameterAvpFramed_IP_Address	*var_framed_ip_address;
@property(readwrite,strong,atomic)	UMDiameterAvpFramed_IPv6_Prefix	*var_framed_ipv6_prefix;
@property(readwrite,strong,atomic)	UMDiameterAvpFramed_Interface_Id	*var_framed_interface_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpLine_Identifier *>	*var_line_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

