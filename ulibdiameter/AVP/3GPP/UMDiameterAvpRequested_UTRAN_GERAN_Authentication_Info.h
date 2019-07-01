//
//  UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpNumber_Of_Requested_Vectors;
@class UMDiameterAvpImmediate_Response_Preferred;
@class UMDiameterAvpRe_synchronization_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpRequested_UTRAN_GERAN_Authentication_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpNumber_Of_Requested_Vectors	*_number_of_requested_vectors;
	UMDiameterAvpImmediate_Response_Preferred	*_immediate_response_preferred;
	UMDiameterAvpRe_synchronization_Info	*_re_synchronization_info;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpNumber_Of_Requested_Vectors	*number_of_requested_vectors;
@property(readwrite,strong,atomic)	UMDiameterAvpImmediate_Response_Preferred	*immediate_response_preferred;
@property(readwrite,strong,atomic)	UMDiameterAvpRe_synchronization_Info	*re_synchronization_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

