//
//  UMDiameterAvpArea_Definition.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpArea_Definition.h>
#import <ulibdiameter/UMDiameterAvpArea.h>
#import <ulibdiameter/UMDiameterAvpAdditional_Area.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpArea_Definition


- (NSString *)avpType
{
    return @"Area-Definition";
}

- (uint32_t)avpCode
{
    return 2534;
}

+ (uint32_t)avpCode
{
    return 2534;
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
    if(_var_area.count > 0)
    {
        for(UMDiameterAvpArea *o in _var_area)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_additional_area.count > 0)
    {
        for(UMDiameterAvpAdditional_Area *o in _var_additional_area)
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
        if(avp.avpCode == [UMDiameterAvpArea  avpCode])
        {
            UMDiameterAvpArea *avp2 = [[UMDiameterAvpArea alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_area == NULL)
            {
                _var_area = @[avp2];
            }
            else
            {
                _var_area = [_var_area arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpAdditional_Area avpCode])
        {
            UMDiameterAvpAdditional_Area *avp2 = [[UMDiameterAvpAdditional_Area alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_additional_area == NULL)
            {
                _var_additional_area = @[avp2];
            }
            else
            {
                _var_additional_area = [_var_additional_area arrayByAddingObject:avp2];
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
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[area][]",webName];
        [UMDiameterAvpArea appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[additional-area][]",webName];
        [UMDiameterAvpAdditional_Area appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
		if(_var_area.count>0)
		{
			for(UMDiameterAvp *avp in _var_area)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Area"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_additional_area.count>0)
		{
			for(UMDiameterAvp *avp in _var_additional_area)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Additional-Area"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"area-definition";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpArea definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        def[@"minimum-count"]=@(1);
        def[@"maximum-count"]=@(10);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAdditional_Area definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        def[@"maximum-count"]=@(240);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

