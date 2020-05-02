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
        _exactHost      = YES;
        _exactRealm     = NO;
        _defaultRoute   = NO;
        NSString *destination = conf[@"destination"];
        if(destination ==NULL)
        {
            NSLog(@"DiameterRoute with no destination %@",conf);
            return NULL;
        }
        _destination    = [destination stringValue];
        if([destination isEqualToStringCaseInsensitive:@"local"])
        {
            _local = YES;
        }
        _hostname       = [conf[@"hostname"] stringValue];
        _realm          = [conf[@"realm"]stringValue];
        _defaultRoute   = [conf[@"default-route"] boolValue];
        if(conf[@"application-id"])
        {
            _applicationId  = @([conf[@"application-id"] integerValue]);
        }
        _oneTimeRoute   = NO;
        if(conf[@"weight"])
        {
            _weight         = @([conf[@"weight"] doubleValue]);
        }
        else
        {
            _weight = @(100.0);
        }
        if(conf[@"priority"])
        {
            _priority       = @([conf[@"priority"] doubleValue]);
        }
        else
        {
            if(_defaultRoute)
            {
                _priority = @(9);
            }
            else
            {
                _priority = @(5);
            }
        }
        if(conf[@"local"])
        {
            _local          = [conf[@"local"] boolValue];
        }
        
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

- (BOOL)matchesRealm:(NSString *)realm
{
    return [self matchesRealm:realm exactMatch:_exactRealm];
}

- (BOOL)matchesRealm:(NSString *)realm exactMatch:(BOOL)exactOnly
{
    if(_defaultRoute)
    {
        return YES;
    }
    if([_realm isEqualToStringCaseInsensitive:realm])
    {
        return YES;
    }
    if(exactOnly)
    {
        return NO;
    }
    if(_realm.length >= realm.length)
    {
        return NO;
    }
    NSInteger pos = realm.length - _realm.length;
    NSString *s = [realm substringFromIndex:pos];
    if([_realm isEqualToStringCaseInsensitive:s])
    {
        return YES;
    }
    return NO;
}

- (BOOL)matchesHost:(NSString *)host
{
    return [self matchesHost:host exactMatch:_exactHost];
}

- (BOOL)matchesHost:(NSString *)host  exactMatch:(BOOL)exactOnly
{
    if(_defaultRoute)
    {
        return YES;
    }
    if([_hostname isEqualToStringCaseInsensitive:host])
    {
        return YES;
    }
    if(exactOnly)
    {
        return NO;
    }
    if(_hostname.length >= host.length)
    {
        return NO;
    }
    NSInteger pos = host.length - _hostname.length;
    NSString *s = [host substringFromIndex:pos];
    if([_hostname isEqualToStringCaseInsensitive:s])
    {
        return YES;
    }
    return NO;
}

@end
