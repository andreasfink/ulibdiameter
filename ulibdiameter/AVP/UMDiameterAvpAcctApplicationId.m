//
//  UMDiameterAvpAccotApplicationId.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAcctApplicationId.h"

@implementation UMDiameterAvpAcctApplicationId

- (NSString *)avpType
{
    return @"AcctApplicationId";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctApplicationId;
}

@end
