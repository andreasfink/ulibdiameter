//
//  UMDiameterAvpService_Selection.m
//  ulibdiameter
//
//  Created by afink on 2019-10-11 07:01:28.749000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Selection.h"

@implementation UMDiameterAvpService_Selection


- (NSString *)avpType
{
    return @"Service-Selection";
}

- (uint32_t)avpCode
{
    return 493;
}

+ (uint32_t)avpCode
{
    return 493;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

