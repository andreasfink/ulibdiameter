//
//  UMDiameterPacketDWR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.127000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketDWR.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketDWR

- (UMDiameterPacketDWR *)initWithString:(NSString *)s
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
    self.commandCode = 280;
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
    if(_origin_state_id)
    {
        [arr addObject:_origin_state_id]
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

