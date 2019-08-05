//
//  UMDiameterAvpAccounting_Record_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAccounting_Record_Type.h"

@implementation UMDiameterAvpAccounting_Record_Type


- (NSString *)avpType
{
    return @"Accounting-Record-Type";
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

