//
//  UMDiameterAvpDigest_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDigest_Realm.h"

@implementation UMDiameterAvpDigest_Realm


- (NSString *)avpType
{
    return @"Digest-Realm";
}

- (uint32_t)avpCode
{
    return 104;
}

+ (uint32_t)avpCode
{
    return 104;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

