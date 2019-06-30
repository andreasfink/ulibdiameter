//
//  UMDiameterAvpOriginRealm.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpOrigin_Realm.h"

@implementation UMDiameterAvpOrigin_Realm

- (NSString *)avpType
{
    return @"Origin-Realm";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_OriginRealm;
}


@end
