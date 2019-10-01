//
//  UMDiameterAvpRequested_EUTRAN_Authentication_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpNumber_Of_Requested_Vectors;
@class UMDiameterAvpImmediate_Response_Preferred;
@class UMDiameterAvpRe_Synchronization_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpRequested_EUTRAN_Authentication_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpNumber_Of_Requested_Vectors	*_var_number_of_requested_vectors;
	UMDiameterAvpImmediate_Response_Preferred	*_var_immediate_response_preferred;
	UMDiameterAvpRe_Synchronization_Info	*_var_re_synchronization_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpNumber_Of_Requested_Vectors	*var_number_of_requested_vectors;
@property(readwrite,strong,atomic)	UMDiameterAvpImmediate_Response_Preferred	*var_immediate_response_preferred;
@property(readwrite,strong,atomic)	UMDiameterAvpRe_Synchronization_Info	*var_re_synchronization_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

