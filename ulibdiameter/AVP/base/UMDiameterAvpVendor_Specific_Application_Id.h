//
//  UMDiameterAvpVendor_Specific_Application_Id.h
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.301913
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpAcct_Application_Id;


@interface UMDiameterAvpVendor_Specific_Application_Id : UMDiameterAvpGrouped
{
	UMDiameterAvpVendor_Id	*_var_vendor_id;
	UMDiameterAvpAuth_Application_Id	*_var_auth_application_id;
	UMDiameterAvpAcct_Application_Id	*_var_acct_application_id;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*var_vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Application_Id	*var_auth_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAcct_Application_Id	*var_acct_application_id;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

