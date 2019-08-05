//
//  UMDiameterAvpSession_Binding.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSession_Binding.h"

@implementation UMDiameterAvpSession_Binding


- (NSString *)avpType
{
    return @"Session-Binding";
}

- (uint32_t)avpCode
{
    return 270;
}

+ (uint32_t)avpCode
{
    return 270;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

