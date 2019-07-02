//
//  UMDiameterAvpSupported_Applications.h
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpAcct_Application_Id;
@class UMDiameterAvpVendor_Specific_Application_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSupported_Applications : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpAuth_Application_Id *>	*_var_auth_application_id;
	NSArray<UMDiameterAvpAcct_Application_Id *>	*_var_acct_application_id;
	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*_var_vendor_specific_application_id;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAuth_Application_Id *>	*var_auth_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAcct_Application_Id *>	*var_acct_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpVendor_Specific_Application_Id *>	*var_vendor_specific_application_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

