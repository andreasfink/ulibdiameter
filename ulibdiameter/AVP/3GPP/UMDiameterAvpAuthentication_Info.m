//
//  UMDiameterAvpAuthentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2021-03-21 13:35:20.533812
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAuthentication_Info.h"
#import "UMDiameterAvpE_UTRAN_Vector.h"
#import "UMDiameterAvpUTRAN_Vector.h"
#import "UMDiameterAvpGERAN_Vector.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAuthentication_Info


- (NSString *)avpType
{
    return @"Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1413;
}

+ (uint32_t)avpCode
{
    return 1413;
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
    if(_var_e_utran_vector.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Vector *o in _var_e_utran_vector)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_utran_vector.count > 0)
    {
        for(UMDiameterAvpUTRAN_Vector *o in _var_utran_vector)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_geran_vector.count > 0)
    {
        for(UMDiameterAvpGERAN_Vector *o in _var_geran_vector)
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
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpE_UTRAN_Vector  avpCode])
        {
            UMDiameterAvpE_UTRAN_Vector *avp2 = [[UMDiameterAvpE_UTRAN_Vector alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_e_utran_vector == NULL)
            {
                _var_e_utran_vector = @[avp2];
            }
            else
            {
                _var_e_utran_vector = [_var_e_utran_vector arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpUTRAN_Vector avpCode])
        {
            UMDiameterAvpUTRAN_Vector *avp2 = [[UMDiameterAvpUTRAN_Vector alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_utran_vector == NULL)
            {
                _var_utran_vector = @[avp2];
            }
            else
            {
                _var_utran_vector = [_var_utran_vector arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpGERAN_Vector avpCode])
        {
            UMDiameterAvpGERAN_Vector *avp2 = [[UMDiameterAvpGERAN_Vector alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_geran_vector == NULL)
            {
                _var_geran_vector = @[avp2];
            }
            else
            {
                _var_geran_vector = [_var_geran_vector arrayByAddingObject:avp2];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[e-utran-vector][]",webName];
        [UMDiameterAvpE_UTRAN_Vector appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[utran-vector][]",webName];
        [UMDiameterAvpUTRAN_Vector appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[geran-vector][]",webName];
        [UMDiameterAvpGERAN_Vector appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
		if(_var_e_utran_vector.count>0)
		{
			for(UMDiameterAvp *avp in _var_e_utran_vector)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"E-UTRAN-Vector"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_utran_vector.count>0)
		{
			for(UMDiameterAvp *avp in _var_utran_vector)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"UTRAN-Vector"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_geran_vector.count>0)
		{
			for(UMDiameterAvp *avp in _var_geran_vector)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"GERAN-Vector"] = arr;
		}
	}
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"authentication-info";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpE_UTRAN_Vector definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpUTRAN_Vector definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGERAN_Vector definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

