//
//  UMDiameterAvpError_Message.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:36.720000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpError_Message.h"

@implementation UMDiameterAvpError_Message


- (NSString *)avpType
{
    return @"Error-Message";
}

- (uint32_t)avpCode
{
    return 281;
}

+ (uint32_t)avpCode
{
    return 281;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

