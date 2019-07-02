//
//  UMDiameterAvpSession_Binding.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 21:59:20.338000
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

