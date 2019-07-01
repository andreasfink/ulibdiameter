//
//  UMDiameterAvpTerminal_Information.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpIMEI;
@class UMDiameterAvp3GPP2_MEID;
@class UMDiameterAvpSoftware_Version;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpTerminal_Information : UMDiameterAvpGrouped
{
	UMDiameterAvpIMEI	*_imei;
	UMDiameterAvp3GPP2_MEID	*_3gpp2_meid;
	UMDiameterAvpSoftware_Version	*_software_version;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpIMEI	*imei;
@property(readwrite,strong,atomic)	UMDiameterAvp3GPP2_MEID	*3gpp2_meid;
@property(readwrite,strong,atomic)	UMDiameterAvpSoftware_Version	*software_version;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

