//
//  UMDiameterPacketDPR.m
//  ulibdiameter
//
//  Created by afink on 2019-07-10 00:07:37.182000
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

+ (uint32_t)commandCode
{
    return 282;
}

+ (uint32_t)defaultApplicationId
{
    return 0;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_origin_host)
    {
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [arr addObject:_var_origin_realm];
    }
    if(_var_disconnect_cause)
    {
        [arr addObject:_var_disconnect_cause];
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

    if(dict[@"disconnect-cause"])
    {
        _var_disconnect_cause = [[UMDiameterAvpDisconnect_Cause alloc]init];
        _var_disconnect_cause.objectValue = dict[@"disconnect-cause"];
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
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_disconnect_cause)
    {
        dict[@"disconnect-cause"] = _var_disconnect_cause.objectValue;
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
    [s appendString:@"    <td class=mandatory>origin-host</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"origin-host\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>origin-realm</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"origin-realm\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=mandatory>disconnect-cause</td>\n"];
    [s appendString:@"    <td class=mandatory><input name=\"disconnect-cause\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

    [s appendString:@"<tr>\n"];
    [s appendString:@"    <td class=optional>avp</td>\n"];
    [s appendString:@"    <td class=optional><input name=\"avp\" type=text> </td>\n"];
    [s appendString:@"</tr>\n"];

}

@end

