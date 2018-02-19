//
//  UMDiameterCommandCode.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//


typedef enum UMDiameterCommandCode
{
    UMDiameterCommandCode_Abort_Session = 274,
    UMDiameterCommandCode_Accounting = 271,
    UMDiameterCommandCode_Capabilities_Exchange = 257,
    UMDiameterCommandCode_Device_Watchdog = 280,
    UMDiameterCommandCode_Disconnect_Peer = 282,
    UMDiameterCommandCode_Re_Auth = 258,
    UMDiameterCommandCode_Session_Termination = 275,
} UMDiameterCommandCode;

extern NSString *UMDiameterCommandCode_description(UMDiameterCommandCode code, BOOL request);
