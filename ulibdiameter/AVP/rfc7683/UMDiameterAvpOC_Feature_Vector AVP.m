//
//  UMDiameterAvpOC_Feature_Vector AVP.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 13:33:16.191000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpOC_Feature_Vector AVP.h"

@implementation UMDiameterAvpOC_Feature_Vector AVP


- (NSString *)avpType
{
    return @"OC-Feature-Vector AVP";
}

- (uint32_t)avpCode
{
    return 622;
}

+ (uint32_t)avpCode
{
    return 622;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}


@end

