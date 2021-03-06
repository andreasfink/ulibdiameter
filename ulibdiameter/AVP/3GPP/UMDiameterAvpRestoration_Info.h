//
//  UMDiameterAvpRestoration_Info.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpPath;
@class UMDiameterAvpContact;
@class UMDiameterAvpInitial_CSeq_Sequence_Number;
@class UMDiameterAvpSubscription_Info;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpRestoration_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpPath	*_var_path;
	UMDiameterAvpContact	*_var_contact;
	UMDiameterAvpInitial_CSeq_Sequence_Number	*_var_initial_cseq_sequence_number;
	UMDiameterAvpSubscription_Info	*_var_subscription_info;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpPath	*var_path;
@property(readwrite,strong,atomic)	UMDiameterAvpContact	*var_contact;
@property(readwrite,strong,atomic)	UMDiameterAvpInitial_CSeq_Sequence_Number	*var_initial_cseq_sequence_number;
@property(readwrite,strong,atomic)	UMDiameterAvpSubscription_Info	*var_subscription_info;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

