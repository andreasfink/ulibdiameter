//
//  UMDiameterAvpIMSI_Group_Id.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIMSI_Group_Id.h"
#import "UMDiameterAvpGroup_Service_Id.h"
#import "UMDiameterAvpGroup_PLMN_Id.h"
#import "UMDiameterAvpLocal_Group_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpIMSI_Group_Id


- (NSString *)avpType
{
    return @"IMSI-Group-Id";
}

- (uint32_t)avpCode
{
    return 1675;
}

+ (uint32_t)avpCode
{
    return 1675;
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
    if(_var_group_service_id)
    {
        [_var_group_service_id beforeEncode];
        [arr addObject:_var_group_service_id];
    }
    if(_var_group_plmn_id)
    {
        [_var_group_plmn_id beforeEncode];
        [arr addObject:_var_group_plmn_id];
    }
    if(_var_local_group_id)
    {
        [_var_local_group_id beforeEncode];
        [arr addObject:_var_local_group_id];
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
        if(avp.avpCode == [UMDiameterAvpGroup_Service_Id  avpCode])
        {
            _var_group_service_id = [[UMDiameterAvpGroup_Service_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_group_service_id];
        }
        else if(avp.avpCode == [UMDiameterAvpGroup_PLMN_Id avpCode])
        {
            _var_group_plmn_id = [[UMDiameterAvpGroup_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_group_plmn_id];
        }
        else if(avp.avpCode == [UMDiameterAvpLocal_Group_Id avpCode])
        {
            _var_local_group_id = [[UMDiameterAvpLocal_Group_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_local_group_id];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[group-service-id]",webName];
        [UMDiameterAvpGroup_Service_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[group-plmn-id]",webName];
        [UMDiameterAvpGroup_PLMN_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[local-group-id]",webName];
        [UMDiameterAvpLocal_Group_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Group-Service-Id"] = [_var_group_service_id objectValue];
	dict[@"Group-PLMN-Id"] = [_var_group_plmn_id objectValue];
	dict[@"Local-Group-Id"] = [_var_local_group_id objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"imsi-group-id";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGroup_Service_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpGroup_PLMN_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLocal_Group_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

