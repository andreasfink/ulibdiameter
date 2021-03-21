//
//  UMDiameterAvpV2X_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpV2X_Subscription_Data.h"
#import "UMDiameterAvpV2X_Permission.h"
#import "UMDiameterAvpUE_PC5_AMBR.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpV2X_Subscription_Data


- (NSString *)avpType
{
    return @"V2X-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1688;
}

+ (uint32_t)avpCode
{
    return 1688;
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
    if(_var_v2x_permission)
    {
        [_var_v2x_permission beforeEncode];
        [arr addObject:_var_v2x_permission];
    }
    if(_var_ue_pc5_ambr)
    {
        [_var_ue_pc5_ambr beforeEncode];
        [arr addObject:_var_ue_pc5_ambr];
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
        if(avp.avpCode == [UMDiameterAvpV2X_Permission  avpCode])
        {
            _var_v2x_permission = [[UMDiameterAvpV2X_Permission alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_v2x_permission];
        }
        else if(avp.avpCode == [UMDiameterAvpUE_PC5_AMBR avpCode])
        {
            _var_ue_pc5_ambr = [[UMDiameterAvpUE_PC5_AMBR alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_ue_pc5_ambr];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[v2x-permission]",webName];
        [UMDiameterAvpV2X_Permission appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[ue-pc5-ambr]",webName];
        [UMDiameterAvpUE_PC5_AMBR appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"V2X-Permission"] = [_var_v2x_permission objectValue];
	dict[@"UE-PC5-AMBR"] = [_var_ue_pc5_ambr objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"v2x-subscription-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpV2X_Permission definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUE_PC5_AMBR definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

