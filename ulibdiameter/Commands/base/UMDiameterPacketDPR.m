//
//  UMDiameterPacketDPR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.429000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketDPR.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpDisconnect_Cause.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketDPR


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
    if(_varorigin_host)
    {
        [arr addObject:_varorigin_host];
    }
    if(_varorigin_realm)
    {
        [arr addObject:_varorigin_realm];
    }
    if(_vardisconnect_cause)
    {
        [arr addObject:_vardisconnect_cause];
    }
    if(_varavp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _varavp)
        {
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


@end

