//
//  UMDiameterAvpError_Message.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:53.138000
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

