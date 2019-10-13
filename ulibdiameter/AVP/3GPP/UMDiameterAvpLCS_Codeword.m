//
//  UMDiameterAvpLCS_Codeword.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 13:46:58.017000
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
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}


@end

