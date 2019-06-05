//
//  UMDiameterAvpAcctRecordType.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAcctRecordType.h"

@implementation UMDiameterAvpAcctRecordType



- (NSString *)avpType
{
    return @"AcctRecordType";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_AcctRecordType;
}

@end
