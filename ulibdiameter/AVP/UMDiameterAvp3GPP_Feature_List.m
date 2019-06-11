//
//  UMDiameterAvp3GPP_Feature_List.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Feature_List.h"

@implementation UMDiameterAvp3GPP_Feature_List

- (NSString *)avpType
{
    return @"Feature-List";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Feature_List;
}

@end
