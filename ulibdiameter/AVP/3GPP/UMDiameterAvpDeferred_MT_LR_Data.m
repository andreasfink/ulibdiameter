//
//  UMDiameterAvpDeferred_MT_LR_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpDeferred_MT_LR_Data.h"
#import "UMDiameterAvpDeferred_Location_Type.h"
#import "UMDiameterAvpTermination_Cause.h"

@implementation UMDiameterAvpDeferred_MT_LR_Data


- (NSString *)avpType
{
    return @"Deferred-MT-LR-Data";
}

- (uint32_t)avpCode
{
    return 2547;
}

+ (uint32_t)avpCode
{
    return 2547;
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
    if(_var_deferred_location_type)
    {
        [_var_deferred_location_type beforeEncode];
        [arr addObject:_var_deferred_location_type];
    }
    if(_var_termination_cause)
    {
        [_var_termination_cause beforeEncode];
        [arr addObject:_var_termination_cause];
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
        if(avp.avpCode == [UMDiameterAvpDeferred_Location_Type  avpCode])
        {
            _var_deferred_location_type = [[UMDiameterAvpDeferred_Location_Type alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_deferred_location_type];
        }
        else if(avp.avpCode == [UMDiameterAvpTermination_Cause avpCode])
        {
            _var_termination_cause = [[UMDiameterAvpTermination_Cause alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_termination_cause];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[deferred-location-type]",webName];
        [UMDiameterAvpDeferred_Location_Type appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[termination-cause]",webName];
        [UMDiameterAvpTermination_Cause appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Deferred-Location-Type"] = [_var_deferred_location_type objectValue];
	dict[@"Termination-Cause"] = [_var_termination_cause objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"deferred-mt-lr-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpDeferred_Location_Type definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpTermination_Cause definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

