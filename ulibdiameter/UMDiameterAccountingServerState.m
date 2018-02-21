//
//  UMDiameterAccountingServerState.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAccountingServerState.h"
#import "UMDiameterAccountingServerStateIdle.h"
#import "UMDiameterAccountingServerStateOpen.h"

@class UMDiameterServiceAccounting;

/*
                        SERVER, STATELESS ACCOUNTING
      State     Event                          Action       New State
      ---------------------------------------------------------------

      Idle      Accounting start request       Send         Idle
                received and successfully      accounting
                processed.                     start
                                               answer

      Idle      Accounting event request       Send         Idle
                received and successfully      accounting
                processed.                     event
                                               answer

      Idle      Interim record received        Send         Idle
                and successfully processed.    accounting
                                               interim
                                               answer

      Idle      Accounting stop request        Send         Idle
                received and successfully      accounting
                processed                      stop answer

      Idle      Accounting request received;   Send         Idle
                no space left to store         accounting
                records                        answer;
                                               Result-Code =
                                               OUT_OF_
                                               SPACE


                            SERVER, STATEFUL ACCOUNTING
      State     Event                          Action       New State
      ---------------------------------------------------------------

      Idle      Accounting start request       Send         Open
                received and successfully      accounting
                processed.                     start
                                               answer;
                                               Start Ts

      Idle      Accounting event request       Send         Idle
                received and successfully      accounting
                processed.                     event
                                               answer
      Idle      Accounting request received;   Send         Idle
                no space left to store         accounting
                records                        answer;
                                               Result-Code =
                                               OUT_OF_
                                               SPACE

      Open      Interim record received        Send         Open
                and successfully processed.    accounting
                                               interim
                                               answer;
                                               Restart Ts

      Open      Accounting stop request        Send         Idle
                received and successfully      accounting
                processed                      stop answer;
                                               Stop Ts

      Open      Accounting request received;   Send         Idle
                no space left to store         accounting
                records                        answer;
                                               Result-Code =
                                               OUT_OF_
                                               SPACE;
                                               Stop Ts

      Open      Session supervision timer Ts   Stop Ts      Idle
                expired

*/
@implementation UMDiameterAccountingServerState

- (UMDiameterAccountingServerState *)eventAccountingStartRequestReceived:(UMDiameterService *)service
{
    return [[UMDiameterAccountingServerStateIdle alloc]init];
}

- (UMDiameterAccountingServerState *)eventAccountingEventRequestReceived:(UMDiameterServiceAccounting *)service
{
    return [[UMDiameterAccountingServerStateIdle alloc]init];
}

- (UMDiameterAccountingServerState *)eventInterimRecordReceived:(UMDiameterServiceAccounting *)service
{
    return [[UMDiameterAccountingServerStateIdle alloc]init];
}

- (UMDiameterAccountingServerState *)eventAccountingStopRequestReceived:(UMDiameterServiceAccounting *)service
{
    return [[UMDiameterAccountingServerStateIdle alloc]init];
}


- (UMDiameterAccountingServerState *)eventOutOfSpace:(UMDiameterServiceAccounting *)service
{
    return [[UMDiameterAccountingServerStateIdle alloc]init];
}



@end
