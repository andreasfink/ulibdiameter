//
//  UMDiameterAvpMIP_Mobile_Node_Address.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:46:37.283000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMIP_Mobile_Node_Address.h"

@implementation UMDiameterAvpMIP_Mobile_Node_Address


- (NSString *)avpType
{
    return @"MIP-Mobile-Node-Address";
}

- (uint32_t)avpCode
{
    return 333;
}

+ (uint32_t)avpCode
{
    return 333;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

