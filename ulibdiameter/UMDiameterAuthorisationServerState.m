//
//  UMDiameterAuthorisationServerState.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAuthorisationServerStateAll.h"
#import "UMDiameterService.h"

@implementation UMDiameterAuthorisationServerState



- (UMDiameterAuthorisationServerState *) eventRequestingAccess:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

- (UMDiameterAuthorisationServerState *) eventASRReceivedForUnknownSession:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

- (UMDiameterAuthorisationServerState *) eventRARReceivedForUnknownSession:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

- (UMDiameterAuthorisationServerState *) eventSuccessfulAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

- (UMDiameterAuthorisationServerState *) eventFailedAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

- (UMDiameterAuthorisationServerState *)eventReceivedSTR:(UMDiameterService *)service
{
    [service sendSTA];
    [service cleanup];
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

@end
