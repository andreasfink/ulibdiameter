//
//  UMDiameterAvpDigest_QoP.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDigest_QoP.h"

@implementation UMDiameterAvpDigest_QoP


- (NSString *)avpType
{
    return @"Digest-QoP";
}

- (uint32_t)avpCode
{
    return 110;
}

+ (uint32_t)avpCode
{
    return 110;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

