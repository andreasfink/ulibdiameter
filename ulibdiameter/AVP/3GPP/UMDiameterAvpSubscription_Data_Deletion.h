//
//  UMDiameterAvpSubscription_Data_Deletion.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
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
	UMDiameterAvpDSR_Flags	*_dsr_flags;
	UMDiameterAvpSCEF_ID	*_scef_id;
	NSArray<UMDiameterAvpContext_Identifier *>	*_context_identifier;
	UMDiameterAvpTrace_Reference	*_trace_reference;
	NSArray<UMDiameterAvpTS_Code *>	*_ts_code;
	NSArray<UMDiameterAvpSS_Code *>	*_ss_code;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpDSR_Flags	*dsr_flags;
@property(readwrite,strong,atomic)	UMDiameterAvpSCEF_ID	*scef_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpContext_Identifier *>	*context_identifier;
@property(readwrite,strong,atomic)	UMDiameterAvpTrace_Reference	*trace_reference;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpTS_Code *>	*ts_code;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpSS_Code *>	*ss_code;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

