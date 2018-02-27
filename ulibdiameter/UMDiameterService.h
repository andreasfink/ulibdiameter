//
//  UMDiameterService.h
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
#import <ulibpcap/ulibpcap.h>
@class UMDiameterAvpProxyInfo;
@class UMDiameterAvpDiameterIdentity;
@class UMDiameterAvp;
@class UMDiameterAvpHostIpAddress;
@class UMDiameterAvpVendorId;

@interface UMDiameterService : UMObject
{
    UMSocket                *_socket;
    UMPCAPFile              *_packetTraceFile;
    UMPCAPPseudoConnection  *_packetTracePseudoConnection;
    NSNumber                *_ourVendorId;

    BOOL        _stateless;
    
    uint32_t    _applicationId;
    uint32_t    _hopByHopIdentifier;
    uint32_t    _endToEndIdentifier;

    NSData      *_localDiameterIdentity;
    NSString    *_sessionId;
    
    NSData      *_originRealm;
    NSData      *_destinationRealm;
    NSData      *_destinationHost;
    NSString    *_productName;
    NSNumber    *_firmareRevision;
    
    NSString *_optional_userName;
    NSNumber *_optional_OriginStateId;
    NSMutableArray<UMDiameterAvpProxyInfo *> *_proxyInfos;
    NSMutableArray<UMDiameterAvpDiameterIdentity *> *_routeRecords;
    NSMutableArray<UMDiameterAvp *> *_optional_AVPs;
    
    NSMutableArray<NSData *> *_hostIPs;
    NSMutableArray<NSNumber *> *_supportedVendorIds;
    NSMutableArray<NSNumber *> *_authAppIds;
    NSMutableArray<NSNumber *> *_inbandSecurityIds;
    NSMutableArray<NSNumber *> *_acctApplicationIds;
    NSMutableArray<NSArray *> *_vendorSpecificApplicationIds;
}

@property(readwrite,strong,atomic)      UMSocket                *socket;
@property(readwrite,strong,atomic)      UMPCAPFile              *packetTraceFile;
@property(readwrite,strong,atomic)      UMPCAPPseudoConnection  *packetTracePseudoConnection;

@property(readwrite,assign,atomic)      uint32_t applicationId;
@property(readwrite,assign,atomic)      uint32_t hopByHopIdentifier;
@property(readwrite,assign,atomic)      uint32_t endToEndIdentifier;

@property(readwrite,assign,atomic)      BOOL    stateless;
@property(readwrite,strong,atomic)      NSData  *localDiameterIdentity;
@property(readwrite,strong,atomic)      NSData  *originRealm;
@property(readwrite,strong,atomic)      NSData  *destinationRealm;
@property(readwrite,strong,atomic)      NSData  *destinationHost;
@property(readwrite,strong,atomic)      NSString *sessionId;
@property(readwrite,strong,atomic)      NSNumber *authAppId;

@property(readwrite,strong,atomic) NSString *userName;
@property(readwrite,strong,atomic) NSNumber *originStateId;
@property(readwrite,strong,atomic) NSArray *proxyInfos;
@property(readwrite,strong,atomic) NSArray *routeRecords;
@property(readwrite,strong,atomic) NSArray *optional_AVPs;

- (void)sendRAR;
- (void)cleanup;
- (void)updateSession;
- (void)sendASR;
- (void)sendSTA;
- (void)sendCER;
- (void)sendCEA;

- (void)addLocalIPv4Address:(NSString *)addr;
@end


