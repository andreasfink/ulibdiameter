//
//  UMDiameterAvpDisconnectCause.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDisconnectCause.h"

@implementation UMDiameterAvpDisconnectCause


- (uint32_t)avpCode
{
    return UMDiameterAvpCode_DisconnectCause;
}


@end
