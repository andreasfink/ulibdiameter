//
//  UMDiameterPacket3GPP_UDR.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_UDR.h"
#import "UMDiameterApplicationId.h"
#import "UMDiameterCommandCode.h"

@implementation UMDiameterPacket3GPP_UDR

-(void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode =  UMDiameterCommandCode_3GPP_TS_29_272_UD;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId = UMDiameterApplicationId_3GPP_Sh;
}

@end
