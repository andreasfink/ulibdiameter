//
//  UMDiameterService.h
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>
@class UMDiameterAvpProxyInfo;
@class UMDiameterAvpDiameterIdentity;
@class UMDiameterAvp;

@interface UMDiameterService : UMObject
{
    BOOL    _stateless;
    NSData  *_localDiameterIdentity;
    NSString *_sessionId;
    uint32_t _applicationId;
    uint32_t _hopByHopIdentifier;
    uint32_t _endToEndIdentifier;
    NSData  *_originRealm;
    NSData  *_destinationRealm;
    NSData *_destinationHost;
    uint32_t _authAppId;

    NSString *_optional_userName;
    NSNumber *_optional_OriginStateId;
    NSArray<UMDiameterAvpProxyInfo *> *_optional_ProxyInfos;
    NSArray<UMDiameterAvpDiameterIdentity *> *_optional_routeRecords;
    NSArray<UMDiameterAvp *> *_optional_AVPs;

}

@property(readwrite,assign,atomic)      BOOL    stateless;
@property(readwrite,strong,atomic)      NSData  *localDiameterIdentity;
@property(readwrite,strong,atomic)      NSData  *originRealm;
@property(readwrite,strong,atomic)      NSData  *destinationRealm;
@property(readwrite,strong,atomic)      NSData  *destinationHost;
@property(readwrite,strong,atomic)      NSString *sessionId;
@property(readwrite,assign,atomic)      uint32_t applicationId;
@property(readwrite,assign,atomic)      uint32_t hopByHopIdentifier;
@property(readwrite,assign,atomic)      uint32_t endToEndIdentifier;
@property(readwrite,assign,atomic)      uint32_t authAppId;

@property(readwrite,strong,atomic) NSString *optional_userName;
@property(readwrite,strong,atomic) NSNumber *optional_OriginStateId;
@property(readwrite,strong,atomic) NSArray *optional_ProxyInfos;
@property(readwrite,strong,atomic) NSArray *optional_routeRecords;
@property(readwrite,strong,atomic) NSArray *optional_AVPs;

- (void)sendRAR;
- (void)cleanup;
- (void)updateSession;
- (void)sendASR;
- (void)sendSTA;


@end


