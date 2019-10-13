//
//  UMDiameterAvpDeregistration_Reason.h
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpReason_Code;
@class UMDiameterAvpReason_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpDeregistration_Reason : UMDiameterAvpGrouped
{
	UMDiameterAvpReason_Code	*_var_reason_code;
	UMDiameterAvpReason_Info	*_var_reason_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpReason_Code	*var_reason_code;
@property(readwrite,strong,atomic)	UMDiameterAvpReason_Info	*var_reason_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

