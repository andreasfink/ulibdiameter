//
//  UMDiameterAuthorisationServerStatePending.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterService.h"
#import "UMDiameterAuthorisationServerStateAll.h"

@implementation UMDiameterAuthorisationServerStatePending



- (UMDiameterAuthorisationServerState *)eventSuccessfulAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateOpen alloc]init];
}

- (UMDiameterAuthorisationServerState *)eventFailedAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}


- (UMDiameterAuthorisationServerState *)eventReceivedFailedRAA:(UMDiameterService *)service
{
    [service cleanup];
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}


- (UMDiameterAuthorisationServerState *)eventReceivedSuccessfulRAA:(UMDiameterService *)service
{
    [service updateSession];
    return [[UMDiameterAuthorisationServerStateOpen alloc]init];

}



@end
