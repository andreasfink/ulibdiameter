//
//  UMDiameterAvpError_Message.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:41:35.873000
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

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"error-message";
    avpDef[@"type"] = @"UTF8String";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(NO);

    return avpDef;
}


@end

