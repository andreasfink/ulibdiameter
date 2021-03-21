//
//  UMDiameterAvpUTRAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Vector.h"
#import "UMDiameterAvpItem_Number.h"
#import "UMDiameterAvpRAND.h"
#import "UMDiameterAvpXRES.h"
#import "UMDiameterAvpAUTN.h"
#import "UMDiameterAvpConfidentiality_Key.h"
#import "UMDiameterAvpIntegrity_Key.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUTRAN_Vector


- (NSString *)avpType
{
    return @"UTRAN-Vector";
}

- (uint32_t)avpCode
{
    return 1415;
}

+ (uint32_t)avpCode
{
    return 1415;
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
    if(_var_item_number)
    {
        [_var_item_number beforeEncode];
        [arr addObject:_var_item_number];
    }
    if(_var_rand)
    {
        [_var_rand beforeEncode];
        [arr addObject:_var_rand];
    }
    if(_var_xres)
    {
        [_var_xres beforeEncode];
        [arr addObject:_var_xres];
    }
    if(_var_autn)
    {
        [_var_autn beforeEncode];
        [arr addObject:_var_autn];
    }
    if(_var_confidentiality_key)
    {
        [_var_confidentiality_key beforeEncode];
        [arr addObject:_var_confidentiality_key];
    }
    if(_var_integrity_key)
    {
        [_var_integrity_key beforeEncode];
        [arr addObject:_var_integrity_key];
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
        if(avp.avpCode == [UMDiameterAvpItem_Number  avpCode])
        {
            _var_item_number = [[UMDiameterAvpItem_Number alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_item_number];
        }
        else if(avp.avpCode == [UMDiameterAvpRAND avpCode])
        {
            _var_rand = [[UMDiameterAvpRAND alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_rand];
        }
        else if(avp.avpCode == [UMDiameterAvpXRES avpCode])
        {
            _var_xres = [[UMDiameterAvpXRES alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_xres];
        }
        else if(avp.avpCode == [UMDiameterAvpAUTN avpCode])
        {
            _var_autn = [[UMDiameterAvpAUTN alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_autn];
        }
        else if(avp.avpCode == [UMDiameterAvpConfidentiality_Key avpCode])
        {
            _var_confidentiality_key = [[UMDiameterAvpConfidentiality_Key alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_confidentiality_key];
        }
        else if(avp.avpCode == [UMDiameterAvpIntegrity_Key avpCode])
        {
            _var_integrity_key = [[UMDiameterAvpIntegrity_Key alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_integrity_key];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[item-number]",webName];
        [UMDiameterAvpItem_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[rand]",webName];
        [UMDiameterAvpRAND appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[xres]",webName];
        [UMDiameterAvpXRES appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[autn]",webName];
        [UMDiameterAvpAUTN appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[confidentiality-key]",webName];
        [UMDiameterAvpConfidentiality_Key appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[integrity-key]",webName];
        [UMDiameterAvpIntegrity_Key appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Item-Number"] = [_var_item_number objectValue];
	dict[@"RAND"] = [_var_rand objectValue];
	dict[@"XRES"] = [_var_xres objectValue];
	dict[@"AUTN"] = [_var_autn objectValue];
	dict[@"Confidentiality-Key"] = [_var_confidentiality_key objectValue];
	dict[@"Integrity-Key"] = [_var_integrity_key objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"utran-vector";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpItem_Number definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRAND definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpXRES definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAUTN definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpConfidentiality_Key definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpIntegrity_Key definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

