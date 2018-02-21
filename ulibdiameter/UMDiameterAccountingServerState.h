//
//  UMDiameterAccountingServerState.h
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterService;

@interface UMDiameterAccountingServerState : UMObject



- (UMDiameterAccountingServerState *)eventAccountingStartRequestReceived:(UMDiameterService *)service;
- (UMDiameterAccountingServerState *)eventAccountingEventRequestReceived:(UMDiameterService *)service;
- (UMDiameterAccountingServerState *)eventInterimRecordReceived:(UMDiameterService *)service;
- (UMDiameterAccountingServerState *)eventAccountingStopRequestReceived:(UMDiameterService *)service;
- (UMDiameterAccountingServerState *)eventOutOfSpace:(UMDiameterService *)service;

@end
