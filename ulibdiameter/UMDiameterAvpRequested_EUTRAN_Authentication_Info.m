//
//  UMDiameterAvpRequested_EUTRAN_Authentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpRequested_EUTRAN_Authentication_Info.h>
#import <ulibdiameter/UMDiameterAvpNumber_Of_Requested_Vectors.h>
#import <ulibdiameter/UMDiameterAvpImmediate_Response_Preferred.h>
#import <ulibdiameter/UMDiameterAvpRe_Synchronization_Info.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpRequested_EUTRAN_Authentication_Info


- (NSString *)avpType
{
    return @"Requested-EUTRAN-Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1408;
}

+ (uint32_t)avpCode
{
    return 1408;
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
    if(_var_number_of_requested_vectors)
    {
        [_var_number_of_requested_vectors beforeEncode];
        [arr addObject:_var_number_of_requested_vectors];
    }
    if(_var_immediate_response_preferred)
    {
        [_var_immediate_response_preferred beforeEncode];
        [arr addObject:_var_immediate_response_preferred];
    }
    if(_var_re_synchronization_info)
    {
        [_var_re_synchronization_info beforeEncode];
        [arr addObject:_var_re_synchronization_info];
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
        if(avp.avpCode == [UMDiameterAvpNumber_Of_Requested_Vectors  avpCode])
        {
            _var_number_of_requested_vectors = [[UMDiameterAvpNumber_Of_Requested_Vectors alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_number_of_requested_vectors];
        }
        else if(avp.avpCode == [UMDiameterAvpImmediate_Response_Preferred avpCode])
        {
            _var_immediate_response_preferred = [[UMDiameterAvpImmediate_Response_Preferred alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_immediate_response_preferred];
        }
        else if(avp.avpCode == [UMDiameterAvpRe_Synchronization_Info avpCode])
        {
            _var_re_synchronization_info = [[UMDiameterAvpRe_Synchronization_Info alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_re_synchronization_info];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[number-of-requested-vectors]",webName];
        [UMDiameterAvpNumber_Of_Requested_Vectors appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[immediate-response-preferred]",webName];
        [UMDiameterAvpImmediate_Response_Preferred appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[re-synchronization-info]",webName];
        [UMDiameterAvpRe_Synchronization_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Number-Of-Requested-Vectors"] = [_var_number_of_requested_vectors objectValue];
	dict[@"Immediate-Response-Preferred"] = [_var_immediate_response_preferred objectValue];
	dict[@"Re-Synchronization-Info"] = [_var_re_synchronization_info objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"requested-eutran-authentication-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpNumber_Of_Requested_Vectors definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpImmediate_Response_Preferred definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpRe_Synchronization_Info definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

