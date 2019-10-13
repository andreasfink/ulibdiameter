//
//  UMDiameterAvpInband_Security_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:50:57.979000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpInband_Security_Id.h"

@implementation UMDiameterAvpInband_Security_Id


- (NSString *)avpType
{
    return @"Inband-Security-Id";
}

- (uint32_t)avpCode
{
    return 299;
}

+ (uint32_t)avpCode
{
    return 299;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

