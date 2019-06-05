//
//  UMDiameterAvpAcctInterimIntervall.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAcctInterimIntervall.h"

@implementation UMDiameterAvpAcctInterimIntervall


- (NSString *)avpType
{
    return @"AcctInterimInterval";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctInterimInterval;
}

@end
