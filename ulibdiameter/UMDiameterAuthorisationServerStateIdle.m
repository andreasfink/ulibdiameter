//
//  UMDiameterAuthorisationServerStateIdle.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterService.h"
#import "UMDiameterAuthorisationServerStateAll.h"

@implementation UMDiameterAuthorisationServerStateIdle


/*

                             SERVER, STATEFUL
      State     Event                          Action       New State
      ---------------------------------------------------------------
      Idle      Service-specific authorization Send         Open
                request received, and          successful
                user is authorized             service-
                                               specific
                                               answer

      Idle      Service-specific authorization Send         Idle
                request received, and          failed
                user is not authorized         service-
                                               specific
                                               answer


 The following state machine is observed by a server when it is not
 maintaining state for the session:
                          SERVER, STATELESS
      State     Event                          Action       New State
      ---------------------------------------------------------------
      Idle      Service-specific authorization Send         Idle
                request received, and          service-
                successfully processed         specific
                                               answer


 */


- (UMDiameterAuthorisationServerState *)eventSuccessfulAuthorisationRequest:(UMDiameterService *)service
{
    if(service.stateless)
    {
        return self;
    }
    return [[UMDiameterAuthorisationServerStateOpen alloc]init];
}

- (UMDiameterAuthorisationServerState *)eventFailedAuthorisationRequest:(UMDiameterService *)service
{
    return [[UMDiameterAuthorisationServerStateIdle alloc]init];
}

@end
