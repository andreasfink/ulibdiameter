//
//  UMDiameterTcpConnectionAuthorisationProtocol.h
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum UMDiameterTcpConnectionAuthorisationResult
{
	UMDiameterTcpConnectionAuthorisationResult_successful   = 1,
	UMDiameterTcpConnectionAuthorisationResult_failed       = 0,
} UMDiameterTcpConnectionAuthorisationResult;

@protocol UMDiameterTcpConnectionAuthorisationProtocol

- (UMDiameterTcpConnectionAuthorisationResult)authoriseIncomingDiameterTcpConnection:(UMSocket *)socket;

@end
