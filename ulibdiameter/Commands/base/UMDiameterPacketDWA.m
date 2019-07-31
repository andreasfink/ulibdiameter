//
//  UMDiameterPacketDWA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-31 06:14:09.171000
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

+ (uint32_t)commandCode
{
    return 280;
}

+ (uint32_t)defaultApplicationId
{
    return 0;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_result_code)
    {
        [arr addObject:_var_result_code];
    }
    if(_var_origin_host)
    {
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [arr addObject:_var_origin_realm];
    }
    if(_var_error_message)
    {
        [arr addObject:_var_error_message];
    }
    if(_var_failed_avp)
    {
        [arr addObject:_var_failed_avp];
    }
    if(_var_origin_state_id)
    {
        [arr addObject:_var_origin_state_id];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


- (void)setDictionaryValue:(NSDictionary *)dict
{

    if(dict[@"result-code"])
    {
        _var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        _var_result_code.objectValue = dict[@"result-code"];
    }

    if(dict[@"origin-host"])
    {
        _var_origin_host = [[UMDiameterAvpOrigin_Host alloc]init];
        _var_origin_host.objectValue = dict[@"origin-host"];
    }

    if(dict[@"origin-realm"])
    {
        _var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]init];
        _var_origin_realm.objectValue = dict[@"origin-realm"];
    }

    if(dict[@"error-message"])
    {
        _var_error_message = [[UMDiameterAvpError_Message alloc]init];
        _var_error_message.objectValue = dict[@"error-message"];
    }

    if(dict[@"failed-avp"])
    {
        _var_failed_avp = [[UMDiameterAvpFailed_AVP alloc]init];
        _var_failed_avp.objectValue = dict[@"failed-avp"];
    }

    if(dict[@"origin-state-id"])
    {
        _var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]init];
        _var_origin_state_id.objectValue = dict[@"origin-state-id"];
    }

    if(dict[@"avp"])
    {
        id obj = dict[@"avp"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_avp = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_avp = arr;
        }
    }
}

- (UMSynchronizedSortedDictionary *)dictionaryValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_var_result_code)
    {
        dict[@"result-code"] = _var_result_code.objectValue;
    }
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_error_message)
    {
        dict[@"error-message"] = _var_error_message.objectValue;
    }
    if(_var_failed_avp)
    {
        dict[@"failed-avp"] = _var_failed_avp.objectValue;
    }
    if(_var_origin_state_id)
    {
        dict[@"origin-state-id"] = _var_origin_state_id.objectValue;
    }
    if(_var_avp)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_avp)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"avp"] = arr;
    }
    return dict;
}

+ (void)webDiameterParameters:(NSMutableString *)s
{


    [s appendString:@"<tr>\n"];
    [UMDiameterAvpResult_Code appendWebDiameterParameters:s webName:@"result-code"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpError_Message appendWebDiameterParameters:s webName:@"error-message"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpFailed_AVP appendWebDiameterParameters:s webName:@"failed-avp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [UMDiameterAvpAVP appendWebDiameterParameters:s webName:@"avp"  comment:@"" css:@"optional"];
    [s appendString:@"</tr>\n"];

}

@end

