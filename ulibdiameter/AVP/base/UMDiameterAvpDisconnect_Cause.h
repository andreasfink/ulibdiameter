//
//  UMDiameterAvpDisconnect_Cause.h
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpEnumerated.h"

typedef enum UMDiameterAvpDisconnect_Cause_enum
{
    UMDiameterAvpDisconnect_Cause_REBOOTING                     = 0,
    UMDiameterAvpDisconnect_Cause_BUSY                          = 1,
    UMDiameterAvpDisconnect_Cause_DO_NOT_WANT_TO_TALK_TO_YOU    = 2,
} UMDiameterAvpDisconnect_Cause_enum;

@interface UMDiameterAvpDisconnect_Cause : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

