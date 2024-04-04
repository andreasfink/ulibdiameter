//
//  UMDiameterAvpMSC_SM_Delivery_Outcome.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpMSC_SM_Delivery_Outcome.h>
#import <ulibdiameter/UMDiameterAvpSM_Delivery_Cause.h>
#import <ulibdiameter/UMDiameterAvpAbsent_User_Diagnostic_SM.h>

@implementation UMDiameterAvpMSC_SM_Delivery_Outcome


- (NSString *)avpType
{
    return @"MSC-SM-Delivery-Outcome";
}

- (uint32_t)avpCode
{
    return 3318;
}

+ (uint32_t)avpCode
{
    return 3318;
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
    if(_var_sm_delivery_cause)
    {
        [_var_sm_delivery_cause beforeEncode];
        [arr addObject:_var_sm_delivery_cause];
    }
    if(_var_absent_user_diagnostic_sm)
    {
        [_var_absent_user_diagnostic_sm beforeEncode];
        [arr addObject:_var_absent_user_diagnostic_sm];
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
        if(avp.avpCode == [UMDiameterAvpSM_Delivery_Cause  avpCode])
        {
            _var_sm_delivery_cause = [[UMDiameterAvpSM_Delivery_Cause alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_sm_delivery_cause];
        }
        else if(avp.avpCode == [UMDiameterAvpAbsent_User_Diagnostic_SM avpCode])
        {
            _var_absent_user_diagnostic_sm = [[UMDiameterAvpAbsent_User_Diagnostic_SM alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_absent_user_diagnostic_sm];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[sm-delivery-cause]",webName];
        [UMDiameterAvpSM_Delivery_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[absent-user-diagnostic-sm]",webName];
        [UMDiameterAvpAbsent_User_Diagnostic_SM appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"SM-Delivery-Cause"] = [_var_sm_delivery_cause objectValue];
	dict[@"Absent-User-Diagnostic-SM"] = [_var_absent_user_diagnostic_sm objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"msc-sm-delivery-outcome";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSM_Delivery_Cause definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAbsent_User_Diagnostic_SM definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

