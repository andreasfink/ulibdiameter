//
//  UMDiameterAvpOC_OLR.h
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:20.755000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpOC_Sequence_Number;
@class UMDiameterAvpOC_Report_Type;
@class UMDiameterAvpOC_Reduction_Percentage;
@class UMDiameterAvpOC_Validity_Duration;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpOC_OLR : UMDiameterAvpGrouped
{
	UMDiameterAvpOC_Sequence_Number	*_var_oc_sequence_number;
	UMDiameterAvpOC_Report_Type	*_var_oc_report_type;
	UMDiameterAvpOC_Reduction_Percentage	*_var_oc_reduction_percentage;
	UMDiameterAvpOC_Validity_Duration	*_var_oc_validity_duration;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpOC_Sequence_Number	*var_oc_sequence_number;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Report_Type	*var_oc_report_type;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Reduction_Percentage	*var_oc_reduction_percentage;
@property(readwrite,strong,atomic)	UMDiameterAvpOC_Validity_Duration	*var_oc_validity_duration;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

