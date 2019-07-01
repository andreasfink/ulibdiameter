//
//  UMDiameterAvpAMBR.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpMax_Requested_Bandwidth_UL;
@class UMDiameterAvpMax_Requested_Bandwidth_DL;
@class UMDiameterAvpExtended_Max_Requested_BW_UL;
@class UMDiameterAvpExtended_Max_Requested_BW_DL;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAMBR : UMDiameterAvpGrouped
{
	UMDiameterAvpMax_Requested_Bandwidth_UL	*_max_requested_bandwidth_ul;
	UMDiameterAvpMax_Requested_Bandwidth_DL	*_max_requested_bandwidth_dl;
	UMDiameterAvpExtended_Max_Requested_BW_UL	*_extended_max_requested_bw_ul;
	UMDiameterAvpExtended_Max_Requested_BW_DL	*_extended_max_requested_bw_dl;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpMax_Requested_Bandwidth_UL	*max_requested_bandwidth_ul;
@property(readwrite,strong,atomic)	UMDiameterAvpMax_Requested_Bandwidth_DL	*max_requested_bandwidth_dl;
@property(readwrite,strong,atomic)	UMDiameterAvpExtended_Max_Requested_BW_UL	*extended_max_requested_bw_ul;
@property(readwrite,strong,atomic)	UMDiameterAvpExtended_Max_Requested_BW_DL	*extended_max_requested_bw_dl;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

