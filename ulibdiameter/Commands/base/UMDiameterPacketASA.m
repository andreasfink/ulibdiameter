//
//  UMDiameterPacketASA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.454000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketASA.h"
#import "UMDiameterAvpSession_Id.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpError_Message.h"
#import "UMDiameterAvpError_Reporting_Host.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpRedirect_Host.h"
#import "UMDiameterAvpRedirect_Host_Usage.h"
#import "UMDiameterAvpRedirect_Max_Cache_Time.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketASA


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 274;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_varsession_id)
    {
        [arr addObject:_varsession_id];
    }
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
    if(_varuser_name)
    {
        [arr addObject:_varuser_name];
    }
    if(_varorigin_state_id)
    {
        [arr addObject:_varorigin_state_id];
    }
    if(_varerror_message)
    {
        [arr addObject:_varerror_message];
    }
    if(_varerror_reporting_host)
    {
        [arr addObject:_varerror_reporting_host];
    }
    if(_varfailed_avp)
    {
        [arr addObject:_varfailed_avp];
    }
    if(_varredirect_host.count > 0)
    {
        for(UMDiameterAvpRedirect_Host *o in _varredirect_host)
        {
            [arr addObject:o];
        }
    }
    if(_varredirect_host_usage)
    {
        [arr addObject:_varredirect_host_usage];
    }
    if(_varredirect_max_cache_time)
    {
        [arr addObject:_varredirect_max_cache_time];
    }
    if(_varproxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _varproxy_info)
        {
            [arr addObject:o];
        }
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

