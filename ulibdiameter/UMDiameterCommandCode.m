//
//  UMDiameterCommandCode.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//
#include <ulib/ulib.h>
#include "UMDiameterCommandCode.h"

NSString *UMDiameterCommandCode_description(UMDiameterCommandCode code, BOOL request)
{
    NSString *s = @"__";
    switch(code)
    {
        case UMDiameterCommandCode_Abort_Session:
            s = @"AS";
            break;
        case UMDiameterCommandCode_Accounting:
            s = @"AC";
            break;
        case UMDiameterCommandCode_Capabilities_Exchange:
            s = @"CE";
            break;
        case UMDiameterCommandCode_Device_Watchdog:
            s = @"DW";
            break;
        case UMDiameterCommandCode_Disconnect_Peer:
            s = @"DP";
            break;
        case UMDiameterCommandCode_Re_Auth:
            s = @"RA";
            break;
        case UMDiameterCommandCode_Session_Termination:
            s = @"ST";
            break;
    }
    if(request)
    {
        s = [NSString stringWithFormat:@"%@R",s];
    }
    else
    {
        s = [NSString stringWithFormat:@"%@R",s];
    }
    return s;
}


