//
//  UMDiameterListener.h
//  ulibdiameter
//
//  Created by Andreas Fink on 14.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@interface UMDiameterListener : UMObject
{
    in_port_t   _port;
    UMSocket    *_listenerSocket;
    BOOL        _useTLS;
    id          _authorizeConnectionDelegate;

    UMSleeper   _sleeper;
}

@property(readwrite,assign,atomic)  in_port_t   port;
@property(readwrite,strong,atomic)  UMSocket    *listenerSocket;
@property(readwrite,assign,atomic)  BOOL        useTLS;
@property(readwrite,strong,atomic)  id          authorizeConnectionDelegate;



- (id) init;
- (id) initWithPort:(in_port_t)port;
- (id) initWithPort:(in_port_t)port socketType:(UMSocketType)type;
- (id) initWithPort:(in_port_t)port
         socketType:(UMSocketType)type
                ssl:(BOOL)doSSL
         sslKeyFile:(NSString *)sslKeyFile
        sslCertFile:(NSString *)sslCertFile;

- (id) initWithPort:(in_port_t)port
         socketType:(UMSocketType)type
                ssl:(BOOL)doSSL
         sslKeyFile:(NSString *)sslKeyFile
        sslCertFile:(NSString *)sslCertFile
          taskQueue:(UMTaskQueue *)tq;

@end
