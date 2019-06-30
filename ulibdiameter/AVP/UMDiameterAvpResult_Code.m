//
//  UMDiameterAvpResult_Code.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterResult_Code.h"

@implementation UMDiameterAvpResult_Code


- (NSString *)avpType
{
    return @"Result-Code";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ResultCode;
}

- (UMSynchronizedSortedDictionary *)objectValue
{
    UMSynchronizedSortedDictionary *dict = [super objectValue];
    NSString *s=NULL;
    switch(_value)
    {
        case UMDiameterResultCode_DIAMETER_MULTI_ROUND_AUTH:
            s=@"DIAMETER_MULTI_ROUND_AUTH";
            break;
        case UMDiameterResultCode_DIAMETER_SUCCESS:
            s=@"DIAMETER_SUCCESS";
            break;
        case UMDiameterResultCode_DIAMETER_LIMITED_SUCCESS:
            s=@"DIAMETER_LIMITED_SUCCESS";
            break;
        case UMDiameterResultCode_DIAMETER_FIRST_REGISTRATION:
            s=@"DIAMETER_FIRST_REGISTRATION";
            break;
        case UMDiameterResultCode_DIAMETER_SUBSEQUENT_REGISTRATION:
            s=@"DIAMETER_SUBSEQUENT_REGISTRATION";
            break;
        case UMDiameterResultCode_DIAMETER_UNREGISTERED_SERVICE:
            s=@"DIAMETER_UNREGISTERED_SERVICE";
            break;
        case UMDiameterResultCode_DIAMETER_SUCCESS_SERVER_NAME_NOT_STORED:
            s=@"DIAMETER_SUCCESS_SERVER_NAME_NOT_STORED";
            break;
        case UMDiameterResultCode_DIAMETER_SERVER_SELECTION:
            s=@"DIAMETER_SERVER_SELECTION";
            break;
        case UMDiameterResultCode_DIAMETER_SUCCESS_AUTH_SENT_SERVER_NOT_STORED:
            s=@"DIAMETER_SUCCESS_AUTH_SENT_SERVER_NOT_STORED";
            break;
        case UMDiameterResultCode_DIAMETER_SUCCESS_RELOCATE_HA:
            s=@"DIAMETER_SUCCESS_RELOCATE_HA";
            break;
        case UMDiameterResultCode_DIAMETER_COMMAND_UNSUPPORTED:
            s=@"DIAMETER_COMMAND_UNSUPPORTED";
            break;
        case UMDiameterResultCode_DIAMETER_UNABLE_TO_DELIVER:
            s=@"DIAMETER_UNABLE_TO_DELIVER";
            break;
        case UMDiameterResultCode_DIAMETER_REALM_NOT_SERVED:
            s=@"DIAMETER_REALM_NOT_SERVED";
            break;
        case UMDiameterResultCode_DIAMETER_TOO_BUSY:
            s=@"DIAMETER_TOO_BUSY";
            break;
        case UMDiameterResultCode_DIAMETER_LOOP_DETECTED:
            s=@"DIAMETER_LOOP_DETECTED";
            break;
        case UMDiameterResultCode_DIAMETER_REDIRECT_INDICATION:
            s=@"DIAMETER_REDIRECT_INDICATION";
            break;
        case UMDiameterResultCode_DIAMETER_APPLICATION_UNSUPPORTED:
            s=@"DIAMETER_APPLICATION_UNSUPPORTED";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_HDR_BITS:
            s=@"DIAMETER_INVALID_HDR_BITS";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_AVP_BITS:
            s=@"DIAMETER_INVALID_AVP_BITS";
            break;
        case UMDiameterResultCode_DIAMETER_UNKNOWN_PEER:
            s=@"DIAMETER_UNKNOWN_PEER";
            break;
        case UMDiameterResultCode_DIAMETER_REALM_REDIRECT_INDICATION:
            s=@"DIAMETER_REALM_REDIRECT_INDICATION";
            break;
        case UMDiameterResultCode_DIAMETER_AUTHENTICATION_REJECTED:
            s=@"DIAMETER_AUTHENTICATION_REJECTED";
            break;
        case UMDiameterResultCode_DIAMETER_OUT_OF_SPACE:
            s=@"DIAMETER_OUT_OF_SPACE";
            break;
        case UMDiameterResultCode_ELECTION_LOST:
            s=@"ELECTION_LOST";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_MIP_REPLY_FAILURE:
            s=@"DIAMETER_ERROR_MIP_REPLY_FAILURE";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_HA_NOT_AVAILABLE:
            s=@"DIAMETER_ERROR_HA_NOT_AVAILABLE";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_BAD_KEY:
            s=@"DIAMETER_ERROR_BAD_KEY";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_MIP_FILTER_NOT_SUPPORTED:
            s=@"DIAMETER_ERROR_MIP_FILTER_NOT_SUPPORTED";
            break;
        case UMDiameterResultCode_DIAMETER_END_USER_SERVICE_DENIED:
            s=@"DIAMETER_END_USER_SERVICE_DENIED";
            break;
        case UMDiameterResultCode_DIAMETER_CREDIT_CONTROL_NOT_APPLICABLE:
            s=@"DIAMETER_CREDIT_CONTROL_NOT_APPLICABLE";
            break;
        case UMDiameterResultCode_DIAMETER_CREDIT_LIMIT_REACHED:
            s=@"DIAMETER_CREDIT_LIMIT_REACHED";
            break;
        case UMDiameterResultCode_DIAMETER_USER_NAME_REQUIRED:
            s=@"DIAMETER_USER_NAME_REQUIRED";
            break;
        case UMDiameterResultCode_RESOURCE_FAILURE:
            s=@"RESOURCE_FAILURE";
            break;
        case UMDiameterResultCode_DIAMETER_AVP_UNSUPPORTED:
            s=@"DIAMETER_AVP_UNSUPPORTED";
            break;
        case UMDiameterResultCode_DIAMETER_UNKNOWN_SESSION_ID:
            s=@"DIAMETER_UNKNOWN_SESSION_ID";
            break;
        case UMDiameterResultCode_DIAMETER_AUTHORIZATION_REJECTED:
            s=@"DIAMETER_AUTHORIZATION_REJECTED";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_AVP_VALUE:
            s=@"DIAMETER_INVALID_AVP_VALUE";
            break;
        case UMDiameterResultCode_DIAMETER_MISSING_AVP:
            s=@"DIAMETER_MISSING_AVP";
            break;
        case UMDiameterResultCode_DIAMETER_RESOURCES_EXCEEDED:
            s=@"DIAMETER_RESOURCES_EXCEEDED";
            break;
        case UMDiameterResultCode_DIAMETER_CONTRADICTING_AVPS:
            s=@"DIAMETER_CONTRADICTING_AVPS";
            break;
        case UMDiameterResultCode_DIAMETER_AVP_NOT_ALLOWED:
            s=@"DIAMETER_AVP_NOT_ALLOWED";
            break;
        case UMDiameterResultCode_DIAMETER_AVP_OCCURS_TOO_MANY_TIMES:
            s=@"DIAMETER_AVP_OCCURS_TOO_MANY_TIMES";
            break;
        case UMDiameterResultCode_DIAMETER_NO_COMMON_APPLICATION:
            s=@"DIAMETER_NO_COMMON_APPLICATION";
            break;
        case UMDiameterResultCode_DIAMETER_UNSUPPORTED_VERSION:
            s=@"DIAMETER_UNSUPPORTED_VERSION";
            break;
        case UMDiameterResultCode_DIAMETER_UNABLE_TO_COMPLY:
            s=@"DIAMETER_UNABLE_TO_COMPLY";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_BIT_IN_HEADER:
            s=@"DIAMETER_INVALID_BIT_IN_HEADER";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_AVP_LENGTH:
            s=@"DIAMETER_INVALID_AVP_LENGTH";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_MESSAGE_LENGTH:
            s=@"DIAMETER_INVALID_MESSAGE_LENGTH";
            break;
        case UMDiameterResultCode_DIAMETER_INVALID_AVP_BIT_COMBO:
            s=@"DIAMETER_INVALID_AVP_BIT_COMBO";
            break;
        case UMDiameterResultCode_DIAMETER_NO_COMMON_SECURITY:
            s=@"DIAMETER_NO_COMMON_SECURITY";
            break;
        case UMDiameterResultCode_DIAMETER_RADIUS_AVP_UNTRANSLATABLE:
            s=@"DIAMETER_RADIUS_AVP_UNTRANSLATABLE";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_NO_FOREIGN_HA_SERVICE:
            s=@"DIAMETER_ERROR_NO_FOREIGN_HA_SERVICE";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_END_TO_END_MIP_KEY_ENCRYPTION:
            s=@"DIAMETER_ERROR_END_TO_END_MIP_KEY_ENCRYPTION";
            break;
        case UMDiameterResultCode_DIAMETER_USER_UNKNOWN:
            s=@"DIAMETER_USER_UNKNOWN";
            break;
        case UMDiameterResultCode_DIAMETER_RATING_FAILED:
            s=@"DIAMETER_RATING_FAILED";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_USER_UNKNOWN:
            s=@"DIAMETER_ERROR_USER_UNKNOWN";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_IDENTITIES_DONT_MATCH:
            s=@"DIAMETER_ERROR_IDENTITIES_DONT_MATCH";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_IDENTITY_NOT_REGISTERED:
            s=@"DIAMETER_ERROR_IDENTITY_NOT_REGISTERED";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_ROAMING_NOT_ALLOWED:
            s=@"DIAMETER_ERROR_ROAMING_NOT_ALLOWED";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_IDENTITY_ALREADY_REGISTERED:
            s=@"DIAMETER_ERROR_IDENTITY_ALREADY_REGISTERED";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_AUTH_SCHEME_NOT_SUPPORTED:
            s=@"DIAMETER_ERROR_AUTH_SCHEME_NOT_SUPPORTED";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_IN_ASSIGNMENT_TYPE:
            s=@"DIAMETER_ERROR_IN_ASSIGNMENT_TYPE";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_TOO_MUCH_DATA:
            s=@"DIAMETER_ERROR_TOO_MUCH_DATA";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_NOT_SUPPORTED_USER_DATA:
            s=@"DIAMETER_ERROR_NOT_SUPPORTED_USER_DATA";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_MIP6_AUTH_MODE:
            s=@"DIAMETER_ERROR_MIP6_AUTH_MODE";
            break;
        case UMDiameterResultCode_UNKNOWN_BINDING_TEMPLATE_NAME:
            s=@"UNKNOWN_BINDING_TEMPLATE_NAME";
            break;
        case UMDiameterResultCode_BINDING_FAILURE:
            s=@"BINDING_FAILURE";
            break;
        case UMDiameterResultCode_MAX_BINDINGS_SET_FAILURE:
            s=@"MAX_BINDINGS_SET_FAILURE";
            break;
        case UMDiameterResultCode_MAXIMUM_BINDINGS_REACHED_FOR_ENDPOINT:
            s=@"MAXIMUM_BINDINGS_REACHED_FOR_ENDPOINT";
            break;
        case UMDiameterResultCode_SESSION_EXISTS:
            s=@"SESSION_EXISTS";
            break;
        case UMDiameterResultCode_INSUFFICIENT_CLASSIFIERS:
            s=@"INSUFFICIENT_CLASSIFIERS";
            break;
        case UMDiameterResultCode_DIAMETER_ERROR_EAP_CODE_UNKNOWN:
            s=@"DIAMETER_ERROR_EAP_CODE_UNKNOWN";
            break;
    }
    if(s)
    {
        dict[@"result-code"] = s;
    }
    return dict;
}

@end
