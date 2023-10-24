//
//  UMDiameterAvpT4_Parameters.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:24:05.223965
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpPriority_Indication;
@class UMDiameterAvpSM_RP_SMEA;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpT4_Parameters : UMDiameterAvpGrouped
{
	UMDiameterAvpPriority_Indication	*_var_priority_indication;
	UMDiameterAvpSM_RP_SMEA	*_var_sm_rp_smea;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpPriority_Indication	*var_priority_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpSM_RP_SMEA	*var_sm_rp_smea;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

