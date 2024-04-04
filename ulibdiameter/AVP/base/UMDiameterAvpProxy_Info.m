//
//  UMDiameterAvpProxy_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.722780
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpProxy_Info.h>
#import <ulibdiameter/UMDiameterAvpProxy_Host.h>
#import <ulibdiameter/UMDiameterAvpProxy_State.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpProxy_Info


- (NSString *)avpType
{
    return @"Proxy-Info";
}

- (uint32_t)avpCode
{
    return 284;
}

+ (uint32_t)avpCode
{
    return 284;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_proxy_host)
    {
        [_var_proxy_host beforeEncode];
        [arr addObject:_var_proxy_host];
    }
    if(_var_proxy_state)
    {
        [_var_proxy_state beforeEncode];
        [arr addObject:_var_proxy_state];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


- (void)afterDecode
{
    [super afterDecode];
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpProxy_Host  avpCode])
        {
            _var_proxy_host = [[UMDiameterAvpProxy_Host alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_proxy_host];
        }
        else if(avp.avpCode == [UMDiameterAvpProxy_State avpCode])
        {
            _var_proxy_state = [[UMDiameterAvpProxy_State alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_proxy_state];
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    if(unknownAVPs.count>0)
    {
        _var_avp = unknownAVPs;
        [knownAVPs addObject:[_var_avp copy]];
    }
    [self setArray:knownAVPs];
}

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[proxy-host]",webName];
        [UMDiameterAvpProxy_Host appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[proxy-state]",webName];
        [UMDiameterAvpProxy_State appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Proxy-Host"] = [_var_proxy_host objectValue];
	dict[@"Proxy-State"] = [_var_proxy_state objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"proxy-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpProxy_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpProxy_State definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

