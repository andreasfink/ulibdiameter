//
//  UMDiameterAvpSession_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-10-14 07:52:18.180000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSession_Id.h"

@implementation UMDiameterAvpSession_Id


- (NSString *)avpType
{
    return @"Session-Id";
}

- (uint32_t)avpCode
{
    return 263;
}

+ (uint32_t)avpCode
{
    return 263;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

