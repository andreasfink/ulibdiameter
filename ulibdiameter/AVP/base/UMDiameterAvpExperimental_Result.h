//
//  UMDiameterAvpExperimental_Result.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVendor_Id;
@class UMDiameterAvpExperimental_Result_Code;


@interface UMDiameterAvpExperimental_Result : UMDiameterAvpGrouped
{
	UMDiameterAvpVendor_Id	*_vendor_id;
	UMDiameterAvpExperimental_Result_Code	*_experimental_result_code;
}

@property(readwrite,strong,atomic)	UMDiameterAvpVendor_Id	*vendor_id;
@property(readwrite,strong,atomic)	UMDiameterAvpExperimental_Result_Code	*experimental_result_code;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

