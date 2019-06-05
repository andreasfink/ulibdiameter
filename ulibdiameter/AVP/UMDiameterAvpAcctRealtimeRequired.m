//
//  UMDiameterAvpAcctRealtimeRequired.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAcctRealtimeRequired.h"

@implementation UMDiameterAvpAcctRealtimeRequired

- (NSString *)avpType
{
    return @"AcctRealtimeRequired";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctRealtimeRequired;
}

@end
