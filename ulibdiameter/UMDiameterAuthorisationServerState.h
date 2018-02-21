//
//  UMDiameterAuthorisationServerState.h
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterService;

@interface UMDiameterAuthorisationServerState : UMObject
{

}

- (UMDiameterAuthorisationServerState *) eventRequestingAccess:(UMDiameterService *)service;
- (UMDiameterAuthorisationServerState *) eventASRReceivedForUnknownSession:(UMDiameterService *)service;
- (UMDiameterAuthorisationServerState *) eventRARReceivedForUnknownSession:(UMDiameterService *)service;
- (UMDiameterAuthorisationServerState *) eventSuccessfulAuthorisationRequest:(UMDiameterService *)service;
- (UMDiameterAuthorisationServerState *) eventFailedAuthorisationRequest:(UMDiameterService *)service;
- (UMDiameterAuthorisationServerState *)eventReceivedSTR:(UMDiameterService *)service;


@end
