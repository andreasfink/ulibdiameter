//
//  UMDiameterAvpRedirectMaxCacheTime.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpRedirectMaxCacheTime.h"

@implementation UMDiameterAvpRedirectMaxCacheTime


- (NSString *)avpType
{
    return @"RedirectMaxCacheTime";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_RedirectMaxCacheTime;
}


@end
