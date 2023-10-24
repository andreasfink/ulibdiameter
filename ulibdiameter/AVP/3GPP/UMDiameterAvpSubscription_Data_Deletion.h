//
//  UMDiameterAvpSubscription_Data_Deletion.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpDSR_Flags;
@class UMDiameterAvpSCEF_ID;
@class UMDiameterAvpContext_Identifier;
@class UMDiameterAvpTrace_Reference;
@class UMDiameterAvpTS_Code;
@class UMDiameterAvpSS_Code;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSubscription_Data_Deletion : UMDiameterAvpGrouped
{
	UMDiameterAvpDSR_Flags	*_var_dsr_flags;
	UMDiameterAvpSCEF_ID	*_var_scef_id;
	NSArray<UMDiameterAvpContext_Identifier *>	*_var_context_identifier;
	UMDiameterAvpTrace_Reference	*_var_trace_reference;
	NSArray<UMDiameterAvpTS_Code *>	*_var_ts_code;
	NSArray<UMDiameterAvpSS_Code *>	*_var_ss_code;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpDSR_Flags	*var_dsr_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*var_scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpContext_Identifier *>	*var_context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Reference	*var_trace_reference;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTS_Code *>	*var_ts_code;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSS_Code *>	*var_ss_code;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

