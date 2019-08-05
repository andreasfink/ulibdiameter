//
//  UMDiameterAvpError_Message.m
//  ulibdiameter
//
//  Created by afink on 2019-08-05 22:45:19.957000
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

