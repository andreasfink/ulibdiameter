//
//  UMDiameterAvpError_Diagnostic.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:34:59.588000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpError_Diagnostic.h"

@implementation UMDiameterAvpError_Diagnostic


- (NSString *)avpType
{
    return @"Error-Diagnostic";
}

- (uint32_t)avpCode
{
    return 1614;
}

+ (uint32_t)avpCode
{
    return 1614;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}


@end

