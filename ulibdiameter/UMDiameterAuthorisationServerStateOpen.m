//
//  UMDiameterAuthorisationServerStateOpen.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//


#import "UMDiameterService.h"
#import "UMDiameterAuthorisationServerStateAll.h"

@implementation UMDiameterAuthorisationServerStateOpen



- (UMDiameterAuthorisationServerState *)eventSuccessfulAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateOpen alloc]init];
}

- (UMDiameterAuthorisationServerState *)eventFailedAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}


- (UMDiameterAuthorisationServerState *)eventHomeServerConfirmationRequested:(UMDiameterService *)service
{
    [service sendRAR];
    return [[UMDiameterAuthorisationServerStatePending alloc]init];

}


- (UMDiameterAuthorisationServerState *)eventHomeServerTerminationRequested:(UMDiameterService *)service
{
    [service sendASR];
    return [[UMDiameterAuthorisationServerStateDiscon alloc]init];

}



- (UMDiameterAuthorisationServerState *)eventAuthorisationLifetimeExpiresOnHomeServer:(UMDiameterService *)service
{
    [service cleanup];
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

- (UMDiameterAuthorisationServerState *)eventSessionTimeoutExpiresOnHomeServer:(UMDiameterService *)service
{
    [service cleanup];
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

@end
