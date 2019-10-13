//
//  UMDiameterAvpVisited_Network_Identifier.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:51:02.325000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVisited_Network_Identifier.h"

@implementation UMDiameterAvpVisited_Network_Identifier


- (NSString *)avpType
{
    return @"Visited-Network-Identifier";
}

- (uint32_t)avpCode
{
    return 600;
}

+ (uint32_t)avpCode
{
    return 600;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

