//
//  UMDiameterAvpAccountingRealtimeRequired.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAccountingRealtimeRequired.h"

@implementation UMDiameterAvpAccountingRealtimeRequired

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctRealtimeRequired;
}

@end
