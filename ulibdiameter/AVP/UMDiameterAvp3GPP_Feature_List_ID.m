//
//  UMDiameterAvp3GPP_Feature_List_ID.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp3GPP_Feature_List_ID.h"

@implementation UMDiameterAvp3GPP_Feature_List_ID

- (NSString *)avpType
{
    return @"Feature-List-ID";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_3GPP_Feature_List_ID;
}

@end
