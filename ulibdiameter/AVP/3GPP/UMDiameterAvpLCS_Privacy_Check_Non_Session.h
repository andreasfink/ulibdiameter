//
//  UMDiameterAvpLCS_Privacy_Check_Non_Session.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpLCS_Privacy_Check;


@interface UMDiameterAvpLCS_Privacy_Check_Non_Session : UMDiameterAvpGrouped
{
	UMDiameterAvpLCS_Privacy_Check	*_var_lcs_privacy_check;
}

@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Privacy_Check	*var_lcs_privacy_check;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

