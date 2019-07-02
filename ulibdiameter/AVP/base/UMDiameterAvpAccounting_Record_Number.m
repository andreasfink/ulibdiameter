//
//  UMDiameterAvpAccounting_Record_Number.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:12.639000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccounting_Record_Number.h"

@implementation UMDiameterAvpAccounting_Record_Number


- (NSString *)avpType
{
    return @"Accounting-Record-Number";
}

- (uint32_t)avpCode
{
    return 485;
}

+ (uint32_t)avpCode
{
    return 485;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

