//
//  UMDiameterAvpVendor_Specific_Application_Id.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpAuth_Application_Id;
@class UMDiameterAvpAcct_Application_Id;


@interface UMDiameterAvpVendor_Specific_Application_Id : UMDiameterAvpGrouped
{
	UMDiameterAvpVendor_Id	*_vendor_id;
	UMDiameterAvpAuth_Application_Id	*_auth_application_id;
	UMDiameterAvpAcct_Application_Id	*_acct_application_id;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAuth_Application_Id	*auth_application_id;
@property(readwrite,strong,atomic)	UMDiameterAvpAcct_Application_Id	*acct_application_id;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

