//
//  UMDiameterAvpSubscription_Info.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpCall_ID_SIP_Header;
@class UMDiameterAvpTo_SIP_Header;
@class UMDiameterAvpRecord_Route;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpSubscription_Info : UMDiameterAvpGrouped
{
	UMDiameterAvpCall_ID_SIP_Header	*_var_call_id_sip_header;
	UMDiameterAvpTo_SIP_Header	*_var_to_sip_header;
	UMDiameterAvpRecord_Route	*_var_record_route;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpCall_ID_SIP_Header	*var_call_id_sip_header;
@property(readwrite,strong,atomic)	UMDiameterAvpTo_SIP_Header	*var_to_sip_header;
@property(readwrite,strong,atomic)	UMDiameterAvpRecord_Route	*var_record_route;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

