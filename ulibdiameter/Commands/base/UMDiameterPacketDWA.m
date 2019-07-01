//
//  UMDiameterPacketDWA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.159000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketDWA.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpError_Message.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketDWA

- (UMDiameterPacketDWA *)initWithString:(NSString *)s
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
    self.commandFlags = 0;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_result_code)
    {
        [arr addObject:_result_code]
    }
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_error_message)
    {
        [arr addObject:_error_message]
    }
    if(_failed_avp)
    {
        [arr addObject:_failed_avp]
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

