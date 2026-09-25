//
//  UMDiameterAvpQoS_Profile_Template.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.722780
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpQoS_Profile_Template.h>
#import <ulibdiameter/UMDiameterAvpVendor_Id.h>
#import <ulibdiameter/UMDiameterAvpQoS_Profile_Id.h>
#import <ulibdiameter/UMDiameterAvpAVP.h>

@implementation UMDiameterAvpQoS_Profile_Template


- (NSString *)avpType
{
    return @"QoS-Profile-Template";
}

- (uint32_t)avpCode
{
    return 574;
}

+ (uint32_t)avpCode
{
    return 574;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_vendor_id)
    {
        [_var_vendor_id beforeEncode];
        [arr addObject:_var_vendor_id];
    }
    if(_var_qos_profile_id)
    {
        [_var_qos_profile_id beforeEncode];
        [arr addObject:_var_qos_profile_id];
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
        if(avp.avpCode == [UMDiameterAvpVendor_Id  avpCode])
        {
            _var_vendor_id = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_vendor_id];
        }
        else if(avp.avpCode == [UMDiameterAvpQoS_Profile_Id avpCode])
        {
            _var_qos_profile_id = [[UMDiameterAvpQoS_Profile_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_qos_profile_id];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[vendor-id]",webName];
        [UMDiameterAvpVendor_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[qos-profile-id]",webName];
        [UMDiameterAvpQoS_Profile_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Vendor-Id"] = [_var_vendor_id objectValue];
	dict[@"QoS-Profile-Id"] = [_var_qos_profile_id objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"qos-profile-template";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(NO);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpQoS_Profile_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

