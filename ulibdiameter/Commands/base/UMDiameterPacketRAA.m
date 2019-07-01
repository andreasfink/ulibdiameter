//
//  UMDiameterPacketRAA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.294000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketRAA.h"
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

@implementation UMDiameterPacketRAA

- (UMDiameterPacketRAA *)initWithString:(NSString *)s
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
    self.commandCode = 258;
    self.commandFlags = DIAMETER_COMMAND_FLAG_PROXIABLE;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_session_id)
    {
        [arr addObject:_session_id]
    }
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
    if(_user_name)
    {
        [arr addObject:_user_name]
    }
    if(_origin_state_id)
    {
        [arr addObject:_origin_state_id]
    }
    if(_error_message)
    {
        [arr addObject:_error_message]
    }
    if(_error_reporting_host)
    {
        [arr addObject:_error_reporting_host]
    }
    if(_failed_avp)
    {
        [arr addObject:_failed_avp]
    }
    if(_redirect_host.count > 0)
    {
        for(UMDiameterAvpRedirect_Host *o in _redirect_host)
        {
            [arr addObject:o]
        }
    }
    if(_redirect_host_usage)
    {
        [arr addObject:_redirect_host_usage]
    }
    if(_redirect_max_cache_time)
    {
        [arr addObject:_redirect_max_cache_time]
    }
    if(_proxy_info.count > 0)
    {
        for(UMDiameterAvpProxy_Info *o in _proxy_info)
        {
            [arr addObject:o]
        }
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

