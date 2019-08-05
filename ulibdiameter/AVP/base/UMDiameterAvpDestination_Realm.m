//
//  UMDiameterAvpDestination_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:03:45.174000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDestination_Realm.h"

@implementation UMDiameterAvpDestination_Realm


- (NSString *)avpType
{
    return @"Destination-Realm";
}

- (uint32_t)avpCode
{
    return 283;
}

+ (uint32_t)avpCode
{
    return 283;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

