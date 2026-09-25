//
//  UMDiameterAvpLCS_Privacy_Check_Session.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpGrouped.h>

@class UMDiameterAvpLCS_Privacy_Check;


@interface UMDiameterAvpLCS_Privacy_Check_Session : UMDiameterAvpGrouped
{
	UMDiameterAvpLCS_Privacy_Check	*_var_lcs_privacy_check;
}

@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Privacy_Check	*var_lcs_privacy_check;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

