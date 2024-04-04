//
//  UMDiameterAvpCSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpCSG_Subscription_Data.h>
#import <ulibdiameter/UMDiameterAvpCSG_ID.h>
#import <ulibdiameter/UMDiameterAvpExpiration_Date.h>
#import <ulibdiameter/UMDiameterAvpService_Selection.h>
#import <ulibdiameter/UMDiameterAvpVisited_PLMN_Id.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpCSG_Subscription_Data


- (NSString *)avpType
{
    return @"CSG-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1436;
}

+ (uint32_t)avpCode
{
    return 1436;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_csg_id)
    {
        [_var_csg_id beforeEncode];
        [arr addObject:_var_csg_id];
    }
    if(_var_expiration_date)
    {
        [_var_expiration_date beforeEncode];
        [arr addObject:_var_expiration_date];
    }
    if(_var_service_selection.count > 0)
    {
        for(UMDiameterAvpService_Selection *o in _var_service_selection)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_visited_plmn_id)
    {
        [_var_visited_plmn_id beforeEncode];
        [arr addObject:_var_visited_plmn_id];
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
        if(avp.avpCode == [UMDiameterAvpCSG_ID  avpCode])
        {
            _var_csg_id = [[UMDiameterAvpCSG_ID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_csg_id];
        }
        else if(avp.avpCode == [UMDiameterAvpExpiration_Date avpCode])
        {
            _var_expiration_date = [[UMDiameterAvpExpiration_Date alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_expiration_date];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            UMDiameterAvpService_Selection *avp2 = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_service_selection == NULL)
            {
                _var_service_selection = @[avp2];
            }
            else
            {
                _var_service_selection = [_var_service_selection arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id avpCode])
        {
            _var_visited_plmn_id = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_plmn_id];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[csg-id]",webName];
        [UMDiameterAvpCSG_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[expiration-date]",webName];
        [UMDiameterAvpExpiration_Date appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-selection][]",webName];
        [UMDiameterAvpService_Selection appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[visited-plmn-id]",webName];
        [UMDiameterAvpVisited_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"CSG-ID"] = [_var_csg_id objectValue];
	dict[@"Expiration-Date"] = [_var_expiration_date objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_service_selection.count>0)
		{
			for(UMDiameterAvp *avp in _var_service_selection)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Service-Selection"] = arr;
		}
	}
	dict[@"Visited-PLMN-Id"] = [_var_visited_plmn_id objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"csg-subscription-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCSG_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpExpiration_Date definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Selection definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_PLMN_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

