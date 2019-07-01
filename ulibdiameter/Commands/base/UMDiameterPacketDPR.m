//
//  UMDiameterPacketDPR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.386000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketDPR.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDisconnect_Cause.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketDPR

- (UMDiameterPacketDPR *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        if([self parseString:s]==NO)
        {
            return NULL;
        }
    }
    return self;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 282;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_disconnect_cause)
    {
        [arr addObject:_disconnect_cause]
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


@end

