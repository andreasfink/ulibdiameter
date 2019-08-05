//
//  UMDiameterAvpService_Result.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.350000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpService_Result_Code;


@interface UMDiameterAvpService_Result : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpVendor_Id *>	*_var_vendor_id;
	UMDiameterAvpService_Result_Code	*_var_service_result_code;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpVendor_Id *>	*var_vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpService_Result_Code	*var_service_result_code;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

