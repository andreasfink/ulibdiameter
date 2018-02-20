//
//  UMDiameterError.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterError.h"


NSString *umdiameter_error_string (UMDiameterError err)
{
    switch(err)
    {

        case DIAMETER_COMMAND_UNSUPPORTED:
            return @"DIAMETER_COMMAND_UNSUPPORTED";
            break;

        case DIAMETER_UNABLE_TO_DELIVER:
            return @"DIAMETER_UNABLE_TO_DELIVER";
            break;

        case DIAMETER_REALM_NOT_SERVED:
            return @"DIAMETER_REALM_NOT_SERVED";
            break;

        case DIAMETER_TOO_BUSY:
            return @"DIAMETER_TOO_BUSY";
            break;

        case DIAMETER_LOOP_DETECTED:
            return @"DIAMETER_LOOP_DETECTED";
            break;

        case DIAMETER_REDIRECT_INDICATION:
            return @"DIAMETER_REDIRECT_INDICATION";
            break;

        case DIAMETER_APPLICATION_UNSUPPORTED:
            return @"DIAMETER_APPLICATION_UNSUPPORTED";
            break;

        case DIAMETER_INVALID_HDR_BITS:
            return @"DIAMETER_INVALID_HDR_BITS";
            break;

        case DIAMETER_INVALID_AVP_BITS:
            return @"DIAMETER_INVALID_AVP_BITS";
            break;

        case DIAMETER_UNKNOWN_PEER:
            return @"DIAMETER_UNKNOWN_PEER";
            break;

        case DIAMETER_AUTHENTICATION_REJECTED:
            return @"DIAMETER_AUTHENTICATION_REJECTED";
            break;

        case DIAMETER_OUT_OF_SPACE:
            return @"DIAMETER_OUT_OF_SPACE";
            break;

        case DIAMETER_ELECTION_LOST:
            return @"DIAMETER_ELECTION_LOST";
            break;

        case DIAMETER_AVP_UNSUPPORTED:
            return @"DIAMETER_AVP_UNSUPPORTED";
            break;

        case DIAMETER_UNKNOWN_SESSION_ID:
            return @"DIAMETER_UNKNOWN_SESSION_ID";
            break;

        case DIAMETER_AUTHORIZATION_REJECTED:
            return @"DIAMETER_AUTHORIZATION_REJECTED";
            break;

        case DIAMETER_INVALID_AVP_VALUE:
            return @"DIAMETER_INVALID_AVP_VALUE";
            break;

        case DIAMETER_MISSING_AVP:
            return @"DIAMETER_MISSING_AVP";
            break;

        case DIAMETER_RESOURCES_EXCEEDED:
            return @"DIAMETER_RESOURCES_EXCEEDED";
            break;

        case DIAMETER_CONTRADICTING_AVPS:
            return @"DIAMETER_CONTRADICTING_AVPS";
            break;

        case DIAMETER_AVP_NOT_ALLOWED:
            return @"DIAMETER_AVP_NOT_ALLOWED";
            break;

        case DIAMETER_AVP_OCCURS_TOO_MANY_TIMES:
            return @"DIAMETER_AVP_OCCURS_TOO_MANY_TIMES";
            break;

        case DIAMETER_NO_COMMON_APPLICATION:
            return @"DIAMETER_NO_COMMON_APPLICATION";
            break;

        case DIAMETER_UNSUPPORTED_VERSION:
            return @"DIAMETER_UNSUPPORTED_VERSION";
            break;

        case DIAMETER_UNABLE_TO_COMPLY:
            return @"DIAMETER_UNABLE_TO_COMPLY";
            break;

        case DIAMETER_INVALID_BIT_IN_HEADER:
            return @"DIAMETER_INVALID_BIT_IN_HEADER";
            break;

        case DIAMETER_INVALID_AVP_LENGTH:
            return @"DIAMETER_INVALID_AVP_LENGTH";
            break;

        case DIAMETER_INVALID_MESSAGE_LENGTH:
            return @"DIAMETER_INVALID_MESSAGE_LENGTH";
            break;

        case DIAMETER_INVALID_AVP_BIT_COMBO:
            return @"DIAMETER_INVALID_AVP_BIT_COMBO";
            break;

        case DIAMETER_NO_COMMON_SECURITY:
            return @"DIAMETER_NO_COMMON_SECURITY";
            break;

        default:
            return [NSString stringWithFormat:@"DIAMETER_ERROR_%d",err];
            break;
    }
}
