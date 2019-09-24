//
//  UMDiameterAvpLCS_Codeword.m
//  ulibdiameter
//
//  Created by afink on 2019-09-24 15:11:56.541000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpLCS_Codeword.h"

@implementation UMDiameterAvpLCS_Codeword


- (NSString *)avpType
{
    return @"LCS-Codeword";
}

- (uint32_t)avpCode
{
    return 2511;
}

+ (uint32_t)avpCode
{
    return 2511;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

