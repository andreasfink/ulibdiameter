//
//  UMDiameterAvpTerminal_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:23.971000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpIMEI;
@class UMDiameterAvp3GPP2_MEID;
@class UMDiameterAvpSoftware_Version;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpTerminal_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpIMEI	*_var_imei;
	UMDiameterAvp3GPP2_MEID	*_var_3gpp2_meid;
	UMDiameterAvpSoftware_Version	*_var_software_version;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpIMEI	*var_imei;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP2_MEID	*var_3gpp2_meid;
@property(readwrite,strong,atomic)	UMDiameterAvpSoftware_Version	*var_software_version;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

