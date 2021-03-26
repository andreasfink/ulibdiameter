//
//  UMDiameterAvpService_Parameters.m
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:24:05.223965
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Parameters.h"
#import "UMDiameterAvpT4_Parameters.h"
#import "UMDiameterAvpApplication_Port_Identifier.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpService_Parameters


- (NSString *)avpType
{
    return @"Service-Parameters";
}

- (uint32_t)avpCode
{
    return 3105;
}

+ (uint32_t)avpCode
{
    return 3105;
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
    if(_var_t4_parameters)
    {
        [_var_t4_parameters beforeEncode];
        [arr addObject:_var_t4_parameters];
    }
    if(_var_application_port_identifier)
    {
        [_var_application_port_identifier beforeEncode];
        [arr addObject:_var_application_port_identifier];
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
        if(avp.avpCode == [UMDiameterAvpT4_Parameters  avpCode])
        {
            _var_t4_parameters = [[UMDiameterAvpT4_Parameters alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_t4_parameters];
        }
        else if(avp.avpCode == [UMDiameterAvpApplication_Port_Identifier avpCode])
        {
            _var_application_port_identifier = [[UMDiameterAvpApplication_Port_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_application_port_identifier];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[t4-parameters]",webName];
        [UMDiameterAvpT4_Parameters appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[application-port-identifier]",webName];
        [UMDiameterAvpApplication_Port_Identifier appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"T4-Parameters"] = [_var_t4_parameters objectValue];
	dict[@"Application-Port-Identifier"] = [_var_application_port_identifier objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"service-parameters";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpT4_Parameters definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpApplication_Port_Identifier definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

