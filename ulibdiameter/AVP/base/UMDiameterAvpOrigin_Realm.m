//
//  UMDiameterAvpOrigin_Realm.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 17:32:28.185000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOrigin_Realm.h"

@implementation UMDiameterAvpOrigin_Realm


- (NSString *)avpType
{
    return @"Origin-Realm";
}

- (uint32_t)avpCode
{
    return 296;
}

+ (uint32_t)avpCode
{
    return 296;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

