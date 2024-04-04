//
//  UMDiameterAvpT4_Parameters.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:24:05.223965
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpT4_Parameters.h>
#import <ulibdiameter/UMDiameterAvpPriority_Indication.h>
#import <ulibdiameter/UMDiameterAvpSM_RP_SMEA.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpT4_Parameters


- (NSString *)avpType
{
    return @"T4-Parameters";
}

- (uint32_t)avpCode
{
    return 3106;
}

+ (uint32_t)avpCode
{
    return 3106;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_priority_indication)
    {
        [_var_priority_indication beforeEncode];
        [arr addObject:_var_priority_indication];
    }
    if(_var_sm_rp_smea)
    {
        [_var_sm_rp_smea beforeEncode];
        [arr addObject:_var_sm_rp_smea];
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
        if(avp.avpCode == [UMDiameterAvpPriority_Indication  avpCode])
        {
            _var_priority_indication = [[UMDiameterAvpPriority_Indication alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_priority_indication];
        }
        else if(avp.avpCode == [UMDiameterAvpSM_RP_SMEA avpCode])
        {
            _var_sm_rp_smea = [[UMDiameterAvpSM_RP_SMEA alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sm_rp_smea];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[priority-indication]",webName];
        [UMDiameterAvpPriority_Indication appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sm-rp-smea]",webName];
        [UMDiameterAvpSM_RP_SMEA appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Priority-Indication"] = [_var_priority_indication objectValue];
	dict[@"SM-RP-SMEA"] = [_var_sm_rp_smea objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"t4-parameters";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPriority_Indication definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSM_RP_SMEA definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

