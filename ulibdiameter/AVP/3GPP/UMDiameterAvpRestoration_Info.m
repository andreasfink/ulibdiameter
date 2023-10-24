//
//  UMDiameterAvpRestoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpRestoration_Info.h>
#import <ulibdiameter/UMDiameterAvpPath.h>
#import <ulibdiameter/UMDiameterAvpContact.h>
#import <ulibdiameter/UMDiameterAvpInitial_CSeq_Sequence_Number.h>
#import <ulibdiameter/UMDiameterAvpSubscription_Info.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpRestoration_Info


- (NSString *)avpType
{
    return @"Restoration-Info";
}

- (uint32_t)avpCode
{
    return 649;
}

+ (uint32_t)avpCode
{
    return 649;
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
    if(_var_path)
    {
        [_var_path beforeEncode];
        [arr addObject:_var_path];
    }
    if(_var_contact)
    {
        [_var_contact beforeEncode];
        [arr addObject:_var_contact];
    }
    if(_var_initial_cseq_sequence_number)
    {
        [_var_initial_cseq_sequence_number beforeEncode];
        [arr addObject:_var_initial_cseq_sequence_number];
    }
    if(_var_subscription_info)
    {
        [_var_subscription_info beforeEncode];
        [arr addObject:_var_subscription_info];
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
        if(avp.avpCode == [UMDiameterAvpPath  avpCode])
        {
            _var_path = [[UMDiameterAvpPath alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_path];
        }
        else if(avp.avpCode == [UMDiameterAvpContact avpCode])
        {
            _var_contact = [[UMDiameterAvpContact alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_contact];
        }
        else if(avp.avpCode == [UMDiameterAvpInitial_CSeq_Sequence_Number avpCode])
        {
            _var_initial_cseq_sequence_number = [[UMDiameterAvpInitial_CSeq_Sequence_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_initial_cseq_sequence_number];
        }
        else if(avp.avpCode == [UMDiameterAvpSubscription_Info avpCode])
        {
            _var_subscription_info = [[UMDiameterAvpSubscription_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_subscription_info];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[path]",webName];
        [UMDiameterAvpPath appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[contact]",webName];
        [UMDiameterAvpContact appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[initial-cseq-sequence-number]",webName];
        [UMDiameterAvpInitial_CSeq_Sequence_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[subscription-info]",webName];
        [UMDiameterAvpSubscription_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Path"] = [_var_path objectValue];
	dict[@"Contact"] = [_var_contact objectValue];
	dict[@"Initial-CSeq-Sequence-Number"] = [_var_initial_cseq_sequence_number objectValue];
	dict[@"Subscription-Info"] = [_var_subscription_info objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"restoration-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpPath definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpContact definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpInitial_CSeq_Sequence_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSubscription_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

