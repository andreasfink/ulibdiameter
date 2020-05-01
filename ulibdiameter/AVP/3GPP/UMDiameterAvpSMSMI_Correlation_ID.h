//
//  UMDiameterAvpSMSMI_Correlation_ID.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpHSS_ID;
@class UMDiameterAvpOriginating_SIP_URI;
@class UMDiameterAvpDestination_SIP_URI;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSMSMI_Correlation_ID : UMDiameterAvpGrouped
{
	UMDiameterAvpHSS_ID	*_var_hss_id;
	UMDiameterAvpOriginating_SIP_URI	*_var_originating_sip_uri;
	UMDiameterAvpDestination_SIP_URI	*_var_destination_sip_uri;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpHSS_ID	*var_hss_id;
@property(readwrite,strong,atomic)	UMDiameterAvpOriginating_SIP_URI	*var_originating_sip_uri;
@property(readwrite,strong,atomic)	UMDiameterAvpDestination_SIP_URI	*var_destination_sip_uri;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

