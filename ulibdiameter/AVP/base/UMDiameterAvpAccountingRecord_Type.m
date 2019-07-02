//
//  UMDiameterAvpAccountingRecord_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:14:01.984000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccountingRecord_Type.h"

@implementation UMDiameterAvpAccountingRecord_Type


- (NSString *)avpType
{
    return @"AccountingRecord-Type";
}

- (uint32_t)avpCode
{
    return 480;
}

+ (uint32_t)avpCode
{
    return 480;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

