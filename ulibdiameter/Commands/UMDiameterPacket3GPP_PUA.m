//
//  UMDiameterPacket3GPP_PUA.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_PUA.h"
#import "UMDiameterApplicationId.h"
#import "UMDiameterCommandCode.h"

@implementation UMDiameterPacket3GPP_PUA

-(void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode =  UMDiameterCommandCode_3GPP_TS_29_272_PU;
    self.commandFlags =  DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId = UMDiameterApplicationId_3GPP_S6a_S6d;
}

@end
