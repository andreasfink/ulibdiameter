//
//  UMDiameterAvpExperimental_Result_Code.m
//  ulibdiameter
//
//  Created by afink on 2019-10-15 08:59:18.862000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExperimental_Result_Code.h"

@implementation UMDiameterAvpExperimental_Result_Code


- (NSString *)avpType
{
    return @"Experimental-Result-Code";
}

- (uint32_t)avpCode
{
    return 298;
}

+ (uint32_t)avpCode
{
    return 298;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}


@end

