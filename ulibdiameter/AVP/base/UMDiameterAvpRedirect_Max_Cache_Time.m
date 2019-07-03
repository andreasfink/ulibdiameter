//
//  UMDiameterAvpRedirect_Max_Cache_Time.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 10:35:09.074000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRedirect_Max_Cache_Time.h"

@implementation UMDiameterAvpRedirect_Max_Cache_Time


- (NSString *)avpType
{
    return @"Redirect-Max-Cache-Time";
}

- (uint32_t)avpCode
{
    return 262;
}

+ (uint32_t)avpCode
{
    return 262;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

