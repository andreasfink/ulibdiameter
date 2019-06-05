//
//  UMDiameterAvpAcctSubSessionId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAcctSubSessionId.h"

@implementation UMDiameterAvpAcctSubSessionId


- (NSString *)avpType
{
    return @"AcctSubSessionId";
}


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctSubSessionId;
}

@end
