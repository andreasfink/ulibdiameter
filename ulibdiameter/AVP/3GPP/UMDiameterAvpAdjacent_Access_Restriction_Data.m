//
//  UMDiameterAvpAdjacent_Access_Restriction_Data.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdjacent_Access_Restriction_Data.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAccess_Restriction_Data.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAdjacent_Access_Restriction_Data


- (NSString *)avpType
{
    return @"Adjacent-Access-Restriction-Data";
}

- (uint32_t)avpCode
{
    return 1673;
}

+ (uint32_t)avpCode
{
    return 1673;
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
    if(_var_visited_plmn_id)
    {
        [_var_visited_plmn_id beforeEncode];
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_access_restriction_data)
    {
        [_var_access_restriction_data beforeEncode];
        [arr addObject:_var_access_restriction_data];
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
        if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id  avpCode])
        {
            _var_visited_plmn_id = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_visited_plmn_id];
        }
        else if(avp.avpCode == [UMDiameterAvpAccess_Restriction_Data avpCode])
        {
            _var_access_restriction_data = [[UMDiameterAvpAccess_Restriction_Data alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_access_restriction_data];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[visited-plmn-id]",webName];
        [UMDiameterAvpVisited_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[access-restriction-data]",webName];
        [UMDiameterAvpAccess_Restriction_Data appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Visited-PLMN-Id"] = [_var_visited_plmn_id objectValue];
	dict[@"Access-Restriction-Data"] = [_var_access_restriction_data objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"adjacent-access-restriction-data";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVisited_PLMN_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAccess_Restriction_Data definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

