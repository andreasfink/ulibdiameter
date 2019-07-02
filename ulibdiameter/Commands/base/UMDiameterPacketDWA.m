//
//  UMDiameterPacketDWA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.336000
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
    if(_varresult_code)
    {
        [arr addObject:_varresult_code];
    }
    if(_varorigin_host)
    {
        [arr addObject:_varorigin_host];
    }
    if(_varorigin_realm)
    {
        [arr addObject:_varorigin_realm];
    }
    if(_varerror_message)
    {
        [arr addObject:_varerror_message];
    }
    if(_varfailed_avp)
    {
        [arr addObject:_varfailed_avp];
    }
    if(_varorigin_state_id)
    {
        [arr addObject:_varorigin_state_id];
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

