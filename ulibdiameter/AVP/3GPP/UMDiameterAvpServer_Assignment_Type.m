//
//  UMDiameterAvpServer_Assignment_Type.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServer_Assignment_Type.h"

@implementation UMDiameterAvpServer_Assignment_Type


- (NSString *)avpType
{
    return @"Server-Assignment-Type";
}

- (uint32_t)avpCode
{
    return 614;
}

+ (uint32_t)avpCode
{
    return 614;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

