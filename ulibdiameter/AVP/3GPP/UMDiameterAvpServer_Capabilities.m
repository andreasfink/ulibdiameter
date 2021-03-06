//
//  UMDiameterAvpServer_Capabilities.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpServer_Capabilities.h"
#import "UMDiameterAvpMandatory_Capability.h"
#import "UMDiameterAvpOptional_Capability.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpServer_Capabilities


- (NSString *)avpType
{
    return @"Server-Capabilities";
}

- (uint32_t)avpCode
{
    return 603;
}

+ (uint32_t)avpCode
{
    return 603;
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
    if(_var_mandatory_capability.count > 0)
    {
        for(UMDiameterAvpMandatory_Capability *o in _var_mandatory_capability)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_optional_capability.count > 0)
    {
        for(UMDiameterAvpOptional_Capability *o in _var_optional_capability)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
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
        if(avp.avpCode == [UMDiameterAvpMandatory_Capability  avpCode])
        {
            UMDiameterAvpMandatory_Capability *avp2 = [[UMDiameterAvpMandatory_Capability alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_mandatory_capability == NULL)
            {
                _var_mandatory_capability = @[avp2];
            }
            else
            {
                _var_mandatory_capability = [_var_mandatory_capability arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpOptional_Capability avpCode])
        {
            UMDiameterAvpOptional_Capability *avp2 = [[UMDiameterAvpOptional_Capability alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_optional_capability == NULL)
            {
                _var_optional_capability = @[avp2];
            }
            else
            {
                _var_optional_capability = [_var_optional_capability arrayByAddingObject:avp2];
            }
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[mandatory-capability][]",webName];
        [UMDiameterAvpMandatory_Capability appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[optional-capability][]",webName];
        [UMDiameterAvpOptional_Capability appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_mandatory_capability.count>0)
		{
			for(UMDiameterAvp *avp in _var_mandatory_capability)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Mandatory-Capability"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_optional_capability.count>0)
		{
			for(UMDiameterAvp *avp in _var_optional_capability)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Optional-Capability"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"server-capabilities";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpMandatory_Capability definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOptional_Capability definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

