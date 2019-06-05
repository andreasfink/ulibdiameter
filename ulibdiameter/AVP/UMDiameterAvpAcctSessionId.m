//
//  UMDiameterAvpAcctSessionId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAcctSessionId.h"

@implementation UMDiameterAvpAcctSessionId


- (NSString *)avpType
{
    return @"AcctSessionId";
}


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctSessionId;
}

@end
