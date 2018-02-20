//
//  UMDiameterAvpCodes.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

typedef enum UMDiameterAvpCode
{
    UMDiameterAvpCode_AcctInterimInterval = 85,
    UMDiameterAvpCode_AcctRealtimeRequired = 483,
    UMDiameterAvpCode_AcctMultiSessionId = 50,
    UMDiameterAvpCode_AcctRecordNumber = 485,
    UMDiameterAvpCode_AcctRecordType = 480,
    UMDiameterAvpCode_AcctSessionId = 44,
    UMDiameterAvpCode_AcctSubSessionId = 287,
    UMDiameterAvpCode_AcctApplicationId = 259,
    UMDiameterAvpCode_AuthApplicationId = 258,
    UMDiameterAvpCode_AuthRequestType = 274,
    UMDiameterAvpCode_AuthorizationLifetime = 291,
    UMDiameterAvpCode_AuthGracePeriod = 276,
    UMDiameterAvpCode_AuthSessionState = 277,
    UMDiameterAvpCode_ReAuthRequestType = 285,
    UMDiameterAvpCode_Class = 25,
    UMDiameterAvpCode_DestinationHost = 293,
    UMDiameterAvpCode_DestinationRealm = 283,
    UMDiameterAvpCode_DisconnectCause = 273,
    UMDiameterAvpCode_ErrorMessage = 281,
    UMDiameterAvpCode_ErrorReportingHost = 294,
    UMDiameterAvpCode_EventTimestamp = 55,
    UMDiameterAvpCode_ExperimentalResult = 297,
    UMDiameterAvpCode_ExperimentalResultCode = 298,
    UMDiameterAvpCode_FailedAVP = 279,
    UMDiameterAvpCode_FirmwareRevision = 267,
    UMDiameterAvpCode_HostIPAddress = 257,
    UMDiameterAvpCode_InbandSecurityId = 299,
    UMDiameterAvpCode_MultiRoundTimeOut = 272,
    UMDiameterAvpCode_OriginHost = 264,
    UMDiameterAvpCode_OriginRealm = 296,
    UMDiameterAvpCode_OriginStateId = 278,
    UMDiameterAvpCode_ProductName = 269,
    UMDiameterAvpCode_ProxyHost = 280,
    UMDiameterAvpCode_ProxyInfo = 284,
    UMDiameterAvpCode_ProxyState = 33,
    UMDiameterAvpCode_RedirectHost = 292,
    UMDiameterAvpCode_RedirectHostUsage = 261,
    UMDiameterAvpCode_RedirectMaxCacheTime = 262,
    UMDiameterAvpCode_ResultCode = 268,
    UMDiameterAvpCode_RouteRecord = 282,
    UMDiameterAvpCode_SessionId = 263,
    UMDiameterAvpCode_SessionTimeout = 27,
    UMDiameterAvpCode_SessionBinding = 270,
    UMDiameterAvpCode_SessionServerFailover = 271,
    UMDiameterAvpCode_SupportedVendorId = 265,
    UMDiameterAvpCode_TerminationCause = 295,
    UMDiameterAvpCode_UserName = 1,
    UMDiameterAvpCode_VendorId = 266,
    UMDiameterAvpCode_VendorSpecificApplicationId = 260,
} UMDiameterAvpCode;

NSString *umdiameter_avp_code_string (UMDiameterAvpCode code);
