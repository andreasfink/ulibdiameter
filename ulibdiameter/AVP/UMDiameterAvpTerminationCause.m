//
//  UMDiameterAvpTerminationCause.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpTerminationCause.h"

@implementation UMDiameterAvpTerminationCause


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_TerminationCause;
}


@end
