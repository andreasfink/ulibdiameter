//
//  UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature.h"

@implementation UMDiameterAvpRoaming_Restricted_Due_To_Unsupported_Feature


- (NSString *)avpType
{
    return @"Roaming-Restricted-Due-To-Unsupported-Feature";
}

- (uint32_t)avpCode
{
    return 1457;
}

+ (uint32_t)avpCode
{
    return 1457;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

