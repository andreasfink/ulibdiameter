//
//  UMDiameterAvpEPS_User_State.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpEPS_User_State.h"
#import "UMDiameterAvpMME_User_State.h"
#import "UMDiameterAvpSGSN_User_State.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpEPS_User_State


- (NSString *)avpType
{
    return @"EPS-User-State";
}

- (uint32_t)avpCode
{
    return 1495;
}

+ (uint32_t)avpCode
{
    return 1495;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_mme_user_state)
    {
        [_var_mme_user_state beforeEncode];
        [arr addObject:_var_mme_user_state];
    }
    if(_var_sgsn_user_state)
    {
        [_var_sgsn_user_state beforeEncode];
        [arr addObject:_var_sgsn_user_state];
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
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpMME_User_State  avpCode])
        {
            _var_mme_user_state = [[UMDiameterAvpMME_User_State alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_mme_user_state];
        }
        else if(avp.avpCode == [UMDiameterAvpSGSN_User_State avpCode])
        {
            _var_sgsn_user_state = [[UMDiameterAvpSGSN_User_State alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sgsn_user_state];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[mme-user-state]",webName];
        [UMDiameterAvpMME_User_State appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sgsn-user-state]",webName];
        [UMDiameterAvpSGSN_User_State appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"MME-User-State"] = [_var_mme_user_state objectValue];
	dict[@"SGSN-User-State"] = [_var_sgsn_user_state objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"eps-user-state";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMME_User_State definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSGSN_User_State definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

