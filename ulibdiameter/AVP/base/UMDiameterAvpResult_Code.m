//
//  UMDiameterAvpResult_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:18:11.217000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpResult_Code.h"

@implementation UMDiameterAvpResult_Code


- (NSString *)avpType
{
    return @"Result-Code";
}

- (uint32_t)avpCode
{
    return 268;
}

+ (uint32_t)avpCode
{
    return 268;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

