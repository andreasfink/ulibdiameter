//
//  UMDiameterAvpLCS_Priority.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:13:09.603000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Priority.h"

@implementation UMDiameterAvpLCS_Priority


- (NSString *)avpType
{
    return @"LCS-Priority";
}

- (uint32_t)avpCode
{
    return 2503;
}

+ (uint32_t)avpCode
{
    return 2503;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

