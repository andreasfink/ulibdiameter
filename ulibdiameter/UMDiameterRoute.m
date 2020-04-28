//
//  UMDiameterRoute.m
//  ulibdiameter
//
//  Created by Andreas Fink on 03.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterRoute.h"
#import "UMDiameterPeer.h"
@implementation UMDiameterRoute

- (UMDiameterRoute *)initWithConfig:(NSDictionary *)conf
{
    self = [super init];
    if(self)
    {
        _destination    = [conf[@"destination"] stringValue];
        _hostname       = [conf[@"hostname"] stringValue];
        _realm          = [conf[@"realm"]stringValue];
        _applicationId  = @([conf[@"application-id"] integerValue]);
        _oneTimeRoute   = NO;
        _weight         = @([conf[@"weight"] doubleValue]);
        _priority       = @([conf[@"priority"] doubleValue]);
        _local          = [conf[@"local"] boolValue];
        [self updateIdentifier];
    }
    return self;
}

- (void)updateIdentifier
{
    if(   (_sessionId.length > 0)
       && (_hostname.length == 0)
       && (_realm.length == 0)
       && (_applicationId == NULL))
    {
        _identifier = [NSString stringWithFormat:@"session:%@",_sessionId];
    }
    else if(   (_sessionId.length == 0)
       && (_hostname.length > 0)
       && (_realm.length == 0)
       && (_applicationId==NULL))
    {
        _identifier = [NSString stringWithFormat:@"hostname:%@",_hostname];
    }

    else if(   (_sessionId.length == 0)
            && (_hostname.length == 0)
            && (_realm.length > 0)
            && (_applicationId==NULL))
    {
        _identifier = [NSString stringWithFormat:@"realm:%@",_realm];
    }

    else if(   (_sessionId.length == 0)
            && (_hostname.length == 0)
            && (_realm.length == 0)
            && (_applicationId != NULL))
    {
        _identifier = [NSString stringWithFormat:@"application:%@",_applicationId.stringValue];
    }
    else
    {
        NSLog(@"Can't handle combined routes yet");
        _identifier=@"";
    }
}

@end
