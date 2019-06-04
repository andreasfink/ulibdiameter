//
//  UMDiameterAvp.m
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFlags.h"
#import "UMDiameterAvpCodes.h"
#import "UMDiameterAvpAll.h"


@implementation UMDiameterAvp

- (NSString *)avpType
{
    NSString *s = umdiameter_avp_code_string(_avpCode);
    return s;
}

- (NSString *)avpName
{
    return umdiameter_avp_code_string (self.avpCode);
}


- (UMDiameterAvp *)initWithData:(NSData *)data avpCode:(uint32_t)avpCode
{
	switch(avpCode)
	{
		case UMDiameterAvpCode_AcctRealtimeRequired:
		return [[UMDiameterAvpAcctRealtimeRequired alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AcctMultiSessionId:
		return [[UMDiameterAvpAcctMultiSessionId alloc]initWithData:data];
		break;
/*
		case UMDiameterAvpCode_AcctRecordNumber:
		return [[UMDiameterAvpAcctRecordNumber alloc]initWithData:data];
		break;
*/
		case UMDiameterAvpCode_AcctRecordType:
		return [[UMDiameterAvpAcctRecordType alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AcctSessionId:
		return [[UMDiameterAvpAcctSessionId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AcctSubSessionId:
		return [[UMDiameterAvpAcctSubSessionId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AcctApplicationId:
		return [[UMDiameterAvpAcctApplicationId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AuthApplicationId:
		return [[UMDiameterAvpAuthApplicationId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AuthRequestType:
		return [[UMDiameterAvpAuthRequestType alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AuthorizationLifetime:
		return [[UMDiameterAvpAuthorizationLifetime alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AuthGracePeriod:
		return [[UMDiameterAvpAuthGracePeriod alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_AuthSessionState:
		return [[UMDiameterAvpAuthSessionState alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ReAuthRequestType:
		return [[UMDiameterAvpReAuthRequestType alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_Class:
		return [[UMDiameterAvpClass alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_DestinationHost:
		return [[UMDiameterAvpDestinationHost alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_DestinationRealm:
		return [[UMDiameterAvpDestinationRealm alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_DisconnectCause:
		return [[UMDiameterAvpDisconnectCause alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ErrorMessage:
		return [[UMDiameterAvpErrorMessage alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ErrorReportingHost:
		return [[UMDiameterAvpErrorReportingHost alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_EventTimestamp:
		return [[UMDiameterAvpEventTimestamp alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ExperimentalResult:
		return [[UMDiameterAvpExperimentalResult alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ExperimentalResultCode:
		return [[UMDiameterAvpExperimentalResultCode alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_FailedAvp:
		return [[UMDiameterAvpFailedAvp alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_FirmwareRevision:
		return [[UMDiameterAvpFirmwareRevision alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_HostIpAddress:
		return [[UMDiameterAvpHostIpAddress alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_InbandSecurityId:
		return [[UMDiameterAvpInbandSecurityId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_MultiRoundTimeout:
		return [[UMDiameterAvpMultiRoundTimeout alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_OriginHost:
		return [[UMDiameterAvpOriginHost alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_OriginRealm:
		return [[UMDiameterAvpOriginRealm alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_OriginStateId:
		return [[UMDiameterAvpOriginStateId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ProductName:
		return [[UMDiameterAvpProductName alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ProxyHost:
		return [[UMDiameterAvpProxyHost alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ProxyInfo:
		return [[UMDiameterAvpProxyInfo alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ProxyState:
		return [[UMDiameterAvpProxyState alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_RedirectHost:
		return [[UMDiameterAvpRedirectHost alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_RedirectHostUsage:
		return [[UMDiameterAvpRedirectHostUsage alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_RedirectMaxCacheTime:
		return [[UMDiameterAvpRedirectMaxCacheTime alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_ResultCode:
		return [[UMDiameterAvpResultCode alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_RouteRecord:
		return [[UMDiameterAvpRouteRecord alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_SessionId:
		return [[UMDiameterAvpSessionId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_SessionTimeout:
		return [[UMDiameterAvpSessionTimeout alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_SessionBinding:
		return [[UMDiameterAvpSessionBinding alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_SessionServerFailover:
		return [[UMDiameterAvpSessionServerFailover alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_SupportedVendorId:
		return [[UMDiameterAvpSupportedVendorId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_TerminationCause:
		return [[UMDiameterAvpTerminationCause alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_UserName:
		return [[UMDiameterAvpUserName alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_VendorId:
		return [[UMDiameterAvpVendorId alloc]initWithData:data];
		break;

		case UMDiameterAvpCode_VendorSpecificApplicationId:
		return [[UMDiameterAvpVendorSpecificApplicationId alloc]initWithData:data];
		break;
	}
	return [self initWithData:data];
}

- (UMDiameterAvp *)initWithData:(NSData *)data
{
    if(data.length < 8)
    {
        return NULL;
    }
    const uint8_t *header = data.bytes;
    _avpLength = (header[5] << 16)| (header[6] << 8) | (header[7]);
    if(_avpLength > data.length)
    {
        return NULL;
    }
    self = [super init];
    if(self)
    {
        _avpCode = (header[0] << 24) | (header[1] << 16) | (header[2] << 8) | (header[3] << 0);
        _avpFlags = header[4];
        if(_avpFlags & UMDiameterAvpFlag_Vendor)
        {
            if(_avpLength < 12)
            {
                return NULL;
            }
            if(_avpLength != data.length)
                _avpVendorId = (header[8] << 24) | (header[9] << 16) | (header[10] << 8) | (header[11] << 0);
            _avpData = [NSData dataWithBytes:&header[12]  length:(_avpLength-12)];
        }
        else
        {
            _avpData = [NSData dataWithBytes:&header[8]  length:(_avpLength-8)];
        }
        [self afterDecode];
    }
    return self;
}

- (uint32_t)packetLength
{
    uint32_t dlen = (uint32_t)self.dataLength;
    switch(dlen % 4)
    {
        case 1:
            dlen =  dlen+3;
            break;
        case 2:
            dlen =  dlen+2;
            break;
        case 3:
            dlen =  dlen+1;
            break;
    }
    dlen = dlen + 8; /* code & length */
    if(_avpFlags & UMDiameterAvpFlag_Vendor )
    {
        dlen += 4;
    }
    return dlen;
}

- (uint32_t )dataLength
{
    return (uint32_t)_avpData.length;
}

- (void)calculateAvpLenField
{
	_avpLength = (uint32_t)_avpData.length;
	if(_avpFlags & UMDiameterAvpFlag_Vendor )
	{
		_avpLength+=12;
	}
	else
	{
		_avpLength+=8;
	}
}

- (NSData *)packetData
{
    [self beforeEncode];

    uint8_t header[12];
    uint32_t headerlen;
	[self calculateAvpLenField];
    _avpCode = self.avpCode;
    header[0] = (_avpCode & 0xFF000000) >> 24;
    header[1] = (_avpCode & 0x00FF0000) >> 16;
    header[2] = (_avpCode & 0x0000FF00) >> 8;
    header[3] = (_avpCode & 0x000000FF) >> 0;

    uint8_t flags = self.avpFlags;

    header[4] = flags & 0xFF;
    header[5] = (_avpLength & 0x00FF0000) >> 16;
    header[6] = (_avpLength & 0x0000FF00) >> 8;
    header[7] = (_avpLength & 0x000000FF) >> 0;
    
    if(_avpFlags & UMDiameterAvpFlag_Vendor )
    {
        headerlen = 12;
        header[8] = (_avpVendorId & 0xFF000000) >> 24;
        header[9] = (_avpVendorId & 0x00FF0000) >> 16;
        header[10] = (_avpVendorId & 0x0000FF00) >> 8;
        header[11] = (_avpVendorId & 0x000000FF) >> 0;
    }
    else
    {
        headerlen = 8;
    }
    NSMutableData *d = [[NSMutableData alloc]initWithBytes:header length:headerlen];
    
    if(_avpData.length > 0)
    {
        [d appendData:_avpData];
        /* append padding bytes */
        switch(_avpLength % 4)
        {
			case 0:
				break;
            case 1:
                [d appendBytes:"\0\0\0" length:3];
                break;
            case 2:
                [d appendBytes:"\0\0" length:2];
                break;
            case 3:
                [d appendBytes:"\0" length:1];
                break;
        }
    }
    return d;
}

- (BOOL)flagVendor
{
    if(_avpFlags & UMDiameterAvpFlag_Vendor )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagProtected
{
    if(_avpFlags & UMDiameterAvpFlag_Protected )
    {
        return YES;
    }
    return NO;
}

- (BOOL)flagMandatory
{
    if(_avpFlags & UMDiameterAvpFlag_Mandatory )
    {
        return YES;
    }
    return NO;
}



- (void)setFlagVendor:(BOOL)flag
{
    if(flag)
    {
        _avpFlags |=  UMDiameterAvpFlag_Vendor;
    }
    else
    {
        _avpFlags &= ~UMDiameterAvpFlag_Vendor;
    }
}

- (void)setFlagProtected:(BOOL)flag
{
    if(flag)
    {
        _avpFlags |=  UMDiameterAvpFlag_Protected;
    }
    else
    {
        _avpFlags &= ~UMDiameterAvpFlag_Protected;
    }
}

- (void)setFlagMandatory:(BOOL)flag
{
    if(flag)
    {
        _avpFlags |=  UMDiameterAvpFlag_Mandatory;
    }
    else
    {
        _avpFlags &= ~UMDiameterAvpFlag_Mandatory;
    }
}

- (void)afterDecode
{
    /* to be overriden by subclasses */
}

- (void)beforeEncode
{
    /* to be overriden by subclasses */
}


- (NSString *)description
{
	NSMutableString *s = [[NSMutableString alloc]init];
	NSString *avpCodeString = umdiameter_avp_code_string(_avpCode);
	[s appendFormat:@"AVP Code: %d %@\n",_avpCode,avpCodeString];
	[s appendFormat:@"AVP Flags: 0x%2X",_avpFlags];
	if(self.flagVendor)
	{
		[s appendString:@", Vendor-Specific"];
	}
	if(self.flagMandatory)
	{
		[s appendString:@", Mandatory"];
	}
	if(self.flagProtected)
	{
		[s appendString:@", Protected"];
	}
	[s appendString:@"\n"];
	if(_avpLength==0)
	{
	   [self calculateAvpLenField];
	}
	[s appendFormat:@"AVP Length: %d\n",_avpLength];
	if(_avpFlags & UMDiameterAvpFlag_Vendor )
	{
		[s appendFormat:@"AVP Vendor ID: 0x%08X\n",_avpVendorId];
	}
	[s appendFormat:@"AVP Data: %@\n",[_avpData hexString]];
	[s appendString:[self avpDescription]];
	return s;
}

/* this is normally overloaded */
-(NSString *)avpDescription
{
	return @"";
}


- (UMSynchronizedSortedDictionary *)objectValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    _avpCode = self.avpCode;
    dict[@"avp-code"] = @(_avpCode);
    dict[@"avp-code-description"] = self.avpType;
    NSMutableArray *flags = [[NSMutableArray alloc]init];
    if(self.flagMandatory)
    {
        [flags addObject:@"MANDATORY"];
    }
    if(self.flagProtected)
    {
        [flags addObject:@"PROTECTED"];
    }
    if(self.flagVendor)
    {
        [flags addObject:@"VENDOR"];
    }
    dict[@"avp-flags"] = [flags componentsJoinedByString:@","];

    if(self.flagVendor)
    {
        dict[@"avp-vendor"] = @(_avpVendorId);
    }
    dict[@"avp-data"] = _avpData;
    return dict;
}
@end

