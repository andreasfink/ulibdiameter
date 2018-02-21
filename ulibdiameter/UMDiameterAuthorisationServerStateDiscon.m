//
//  UMDiameterAuthorisationServerStateDiscon.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterService.h"
#import "UMDiameterAuthorisationServerStateAll.h"

@implementation UMDiameterAuthorisationServerStateDiscon


- (UMDiameterAuthorisationServerState *)eventFailureToSendASR:(UMDiameterService *)service
{
    [service sendASR];
    return self;
}

- (UMDiameterAuthorisationServerState *)eventReceivedASA:(UMDiameterService *)service
{
    [service cleanup];
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

@end
