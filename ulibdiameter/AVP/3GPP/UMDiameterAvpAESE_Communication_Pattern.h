//
//  UMDiameterAvpAESE_Communication_Pattern.h
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpSCEF_Reference_ID;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpSCEF_Reference_ID_for_Deletion;
@class UMDiameterAvpCommunication_Pattern_Set;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAESE_Communication_Pattern : UMDiameterAvpGrouped
{
	UMDiameterAvpSCEF_Reference_ID	*_var_scef_reference_id;
	UMDiameterAvpSCEF_ID	*_var_scef_id;
	NSArray<UMDiameterAvpSCEF_Reference_ID_for_Deletion *>	*_var_scef_reference_id_for_deletion;
	NSArray<UMDiameterAvpCommunication_Pattern_Set *>	*_var_communication_pattern_set;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_Reference_ID	*var_scef_reference_id;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*var_scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSCEF_Reference_ID_for_Deletion *>	*var_scef_reference_id_for_deletion;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpCommunication_Pattern_Set *>	*var_communication_pattern_set;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

