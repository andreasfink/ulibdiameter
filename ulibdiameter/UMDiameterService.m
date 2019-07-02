//
//  UMDiameterService.m
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterService.h"
#import "UMDiameterPacket.h"
#import "UMDiameterAvpAll.h"
#import "UMDiameterAVP_Options.h"
@implementation UMDiameterService


- (UMDiameterService *)init
{
    self = [super init];
    if(self)
    {
        _firmareRevision = [NSNumber numberWithInteger:100];
        _productName = @"ulibdiameter";
        _hostIPs = [[NSMutableArray alloc]init];
        _supportedVendorIds = [[NSMutableArray alloc]init];

        _authAppIds = [[NSMutableArray alloc]init];
        _inbandSecurityIds = [[NSMutableArray alloc]init];
        _acctApplicationIds = [[NSMutableArray alloc]init];
        _vendorSpecificApplicationIds = [[NSMutableArray alloc]init];
        _proxyInfos = [[NSMutableArray alloc]init];
        _routeRecords = [[NSMutableArray alloc]init];
        _optional_AVPs = [[NSMutableArray alloc]init];
        _ourVendorId = [NSNumber numberWithInteger:1];
        _originStateId = [NSNumber numberWithInteger:1];
    }
    return self;
}
/*
 
 8.3.  Server-Initiated Re-Auth
 
 A Diameter server may initiate a re-authentication and/or re-
 authorization service for a particular session by issuing a Re-Auth-
 Request (RAR).
 
 For example, for prepaid services, the Diameter server that
 originally authorized a session may need some confirmation that the
 user is still using the services.
 
 An access device that receives an RAR message with the Session-Id
 equal to a currently active session MUST initiate a re-auth towards
 the user, if the service supports this particular feature.  Each
 Diameter application MUST state whether server-initiated re-auth is
 supported, since some applications do not allow access devices to
 prompt the user for re-auth.
 
 8.3.1.  Re-Auth-Request
 
 The Re-Auth-Request (RAR), indicated by the Command Code set to 258
 and the message flags' 'R' bit set, may be sent by any server to the
 access device that is providing session service, to request that the
 user be re-authenticated and/or re-authorized.
 
 
*/

/*
     <RAR>  ::= < Diameter Header: 258, REQ, PXY >
     < Session-Id >
     { Origin-Host }
     { Origin-Realm }
     { Destination-Realm }
     { Destination-Host }
     { Auth-Application-Id }
     { Re-Auth-Request-Type }
     [ User-Name ]
     [ Origin-State-Id ]
     * [ Proxy-Info ]
     * [ Route-Record ]
     * [ AVP ]
 
 */


- (void)sendRAR
{
    UMDiameterPacket *p = [self createRAR];
    [self sendPacket:p];
}




- (void)cleanup
{

}

- (void)updateSession
{

}

- (void)sendASR
{

}

- (void)sendSTA
{

}

static void mandatory_check(int options,id value,NSString *value_name)
{
    if((options & UMDiameterAVP_Option_Mandatory) && (value==NULL))
    {
        @throw([NSException exceptionWithName:@"PARAMETER_VIOLATION" reason:@"#value is not set" userInfo:NULL]);
    }
    if(options & (UMDiameterAVP_Option_One_or_more | UMDiameterAVP_Option_Zero_or_more))
    {
        if(value==NULL)
        {
            NSString *s = [NSString stringWithFormat: @"%@ is NULL",value_name];
            @throw([NSException exceptionWithName:@"PARAMETER_VIOLATION" reason:s userInfo:NULL]);
        }
        if(![value isKindOfClass:[NSArray class]])
        {
            NSString *s = [NSString stringWithFormat: @"%@ is not an array",value_name];
            @throw([NSException exceptionWithName:@"PARAMETER_VIOLATION" reason:s userInfo:NULL]);
        }
        if((options & UMDiameterAVP_Option_One_or_more) && ([value count] < 1))
        {
            NSString *s = [NSString stringWithFormat: @"%@ does not have at least one entry",value_name];
            @throw([NSException exceptionWithName:@"PARAMETER_VIOLATION" reason:s userInfo:NULL]);
        }
    }
}

static int multi_check(int options)
{
    /*
    returns  0 if its not a multi parameter
    returns  1 if its a muli parameter and at least one item is needed
    returns -1 if its a multi parameter with 0 or more  items */
        
    if(!(options & (UMDiameterAVP_Option_One_or_more | UMDiameterAVP_Option_Zero_or_more)))
    {
        return 0;
    }
    if(options & UMDiameterAVP_Option_One_or_more)
    {
        return 1;
    }
    return -1;
}

#define MANDATORY_CHECK(option,value) mandatory_check(option,value,@"#value")


- (void)addOriginHostAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSData *> *)values
{
    mandatory_check(options,values,@"Origin-Host");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSData *value = values[0];
                UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
                avp.avpData = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSData *value in values)
            {
                UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
                avp.avpData = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addOriginRealmAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSData *> *)values
{
    mandatory_check(options,values,@"Origin-Realm");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSData *value = values[0];
                UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
                avp.avpData = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSData *value in values)
            {
                UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
                avp.avpData = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addHostIPAddressAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSData *> *)values
{
    mandatory_check(options,values,@"Host-Id");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSData *value = values[0];
                UMDiameterAvpHostIpAddress *avp = [[UMDiameterAvpHostIpAddress alloc]init];
                avp.avpData = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSData *value in values)
            {
                UMDiameterAvpHostIpAddress *avp = [[UMDiameterAvpHostIpAddress alloc]init];
                avp.avpData = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addVendorIdAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSNumber *> *)values
{
    mandatory_check(options,values,@"Vendor-Id");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpVendorId *avp = [[UMDiameterAvpVendorId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpVendorId *avp = [[UMDiameterAvpVendorId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addProductNameAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSString *>*)values
{
    mandatory_check(options,values,@"Product-Name");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSString *value = values[0];
                UMDiameterAvpProductName *avp = [[UMDiameterAvpProductName alloc]init];
                avp.value = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSString *value in values)
            {
                UMDiameterAvpProductName *avp = [[UMDiameterAvpProductName alloc]init];
                avp.value = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addOriginStateIdAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSNumber *> *)values
{
    mandatory_check(options,values,@"Origin-State-Id");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpOriginStateId *avp = [[UMDiameterAvpOriginStateId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpOriginStateId *avp = [[UMDiameterAvpOriginStateId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }
}


- (void)addSupportedVendorIdAVP:(UMDiameterPacket *)packet
                        options:(int)options
                         values:(NSArray<NSNumber *> *)values
{
    /*  * [ Supported-Vendor-Id ] */
    mandatory_check(options,values,@"Supported-Vendor-Id");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpSupportedVendorId *avp = [[UMDiameterAvpSupportedVendorId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpSupportedVendorId *avp = [[UMDiameterAvpSupportedVendorId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addAuthApplicationIdAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSNumber *> *)values
{
    /*  * [ Auth-Application-Id ] */
    mandatory_check(options,values,@"Auth-Application-Id");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpAuthApplicationId *avp = [[UMDiameterAvpAuthApplicationId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpSupportedVendorId *avp = [[UMDiameterAvpSupportedVendorId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addInbandSecurityIdAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSNumber *> *)values
{
    /*  * [ Inband-Security-Id ]*/
    mandatory_check(options,values,@"Inband-Security-Id");
    if(values)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpInbandSecurityId *avp = [[UMDiameterAvpInbandSecurityId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpInbandSecurityId *avp = [[UMDiameterAvpInbandSecurityId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }
}

- (void)addAcctApplicationIdAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSNumber *> *)values
{
    /*  * [ Acct-Application-Id ] */
    mandatory_check(options,values,@"Acct-Application-Id");
    if(_inbandSecurityIds)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpInbandSecurityId *avp = [[UMDiameterAvpInbandSecurityId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpAcctApplicationId *avp = [[UMDiameterAvpAcctApplicationId alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }
}



- (void)addFirmwareRevisionAVP:(UMDiameterPacket *)packet options:(int)options values:(NSArray<NSNumber *> *)values
{
    /*  [ Firmware-Revision ] */
    mandatory_check(options,values,@"Vendor-Specific-Application-Id");
    if(_inbandSecurityIds)
    {
        if(multi_check(options)==0)
        {
            if(values.count>0)
            {
                NSNumber *value = values[0];
                UMDiameterAvpFirmwareRevision *avp = [[UMDiameterAvpFirmwareRevision alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
        else
        {
            for(NSNumber *value in values)
            {
                UMDiameterAvpFirmwareRevision *avp = [[UMDiameterAvpFirmwareRevision alloc]init];
                avp.number = value;
                [packet appendAvp:avp];
            }
        }
    }

}

- (void)sendCER
{
    UMDiameterPacket *p = [self createCER];
    [self sendPacket:p];
}

- (UMDiameterPacket *)createCER
{
/*
     <CER> ::= < Diameter Header: 257, REQ >
     { Origin-Host }
     { Origin-Realm }
     1* { Host-IP-Address }
     { Vendor-Id }
     { Product-Name }
     [ Origin-State-Id ]
     * [ Supported-Vendor-Id ]
     * [ Auth-Application-Id ]
     * [ Inband-Security-Id ]
     * [ Acct-Application-Id ]
     * [ Vendor-Specific-Application-Id ]
     [ Firmware-Revision ]
     * [ AVP ]
*/

    UMDiameterPacket *packet = [[UMDiameterPacket alloc]init];
    packet.version = 1;
    packet.commandFlags = UMDiameterCommandFlag_Request;
    packet.commandCode = UMDiameterCommandCode_Capabilities_Exchange;
    packet.applicationId = self.applicationId;
    packet.hopByHopIdentifier = self.hopByHopIdentifier;
    packet.endToEndIdentifier = self.endToEndIdentifier;
                                 
    [self addOriginHostAVP:packet options:UMDiameterAVP_Option_Mandatory values:@[_localDiameterIdentity]];
    [self addOriginRealmAVP:packet options:UMDiameterAVP_Option_Mandatory values:@[_originRealm]];
    [self addHostIPAddressAVP:packet options:UMDiameterAVP_Option_Mandatory | UMDiameterAVP_Option_One_or_more values:_hostIPs];
    [self addVendorIdAVP:packet options:UMDiameterAVP_Option_Mandatory values:@[_ourVendorId]];
    [self addProductNameAVP:packet options:UMDiameterAVP_Option_Mandatory values:@[_productName]];
    [self addOriginStateIdAVP:packet options:UMDiameterAVP_Option_Optional values:@[_originStateId]];
    [self addSupportedVendorIdAVP:packet  options:UMDiameterAVP_Option_Zero_or_more values:_supportedVendorIds];
    [self addAuthApplicationIdAVP:packet options:UMDiameterAVP_Option_Zero_or_more values:_authAppIds];
    [self addInbandSecurityIdAVP:packet options:UMDiameterAVP_Option_Zero_or_more values:_inbandSecurityIds];
    [self addAcctApplicationIdAVP:packet options:UMDiameterAVP_Option_Zero_or_more values:_authAppIds];
    [self addFirmwareRevisionAVP:packet options:UMDiameterAVP_Option_Optional values:@[_firmareRevision]];
    return packet;
}

- (void)sendCEA
{
    UMDiameterPacket *p = [self createCER];
    [self sendPacket:p];
}

- (void)createCEA
{
/*
     <CEA> ::= < Diameter Header: 257 >
     { Result-Code }
     { Origin-Host }
     { Origin-Realm }
     1* { Host-IP-Address }
     { Vendor-Id }
     { Product-Name }
     [ Origin-State-Id ]
     [ Error-Message ]
     [ Failed-AVP ]
     * [ Supported-Vendor-Id ]
     * [ Auth-Application-Id ]
     * [ Inband-Security-Id ]
     * [ Acct-Application-Id ]
     * [ Vendor-Specific-Application-Id ]
     [ Firmware-Revision ]
     * [ AVP ]
*/
    
}

- (void)sendPacket:(UMDiameterPacket *)packet
{
    NSData *packedData = [packet packedData];
    if((_packetTraceFile) && (_packetTracePseudoConnection))
    {
        NSData *pdu =[_packetTracePseudoConnection tcpPacket:packedData inbound:NO];
        [_packetTraceFile writePdu:pdu];
    }
	[_socket sendData:packedData];
}

- (void)addLocalIPv4Address:(NSString *)addr
{
    int a;
    int b;
    int c;
    int d;
    
    sscanf(addr.UTF8String,"%d.%d.%d.%d",&a,&b,&c,&d);
    if(   (a >=0) && (a <=255)
      &&  (b >=0) && (b <=255)
      &&  (c >=0) && (c <=255)
      &&  (d >=0) && (d <=255))
    {
        unsigned char bytes[4];
        bytes[0] = a;
        bytes[1] = b;
        bytes[2] = c;
        bytes[3] = d;
        NSData *d = [[NSData alloc]initWithBytes:&bytes length:sizeof(bytes)];
        [_hostIPs addObject:d];
    }
}
@end
