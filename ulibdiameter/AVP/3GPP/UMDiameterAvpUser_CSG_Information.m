//
//  UMDiameterAvpUser_CSG_Information.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:14:19.173694
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUser_CSG_Information.h"
#import "UMDiameterAvpCSG_ID.h"
#import "UMDiameterAvpCSG_Access_Mode.h"
#import "UMDiameterAvpCSG_Membership_Indication.h"

@implementation UMDiameterAvpUser_CSG_Information


- (NSString *)avpType
{
    return @"User-CSG-Information";
}

- (uint32_t)avpCode
{
    return 2319;
}

+ (uint32_t)avpCode
{
    return 2319;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    /* _vendorFlag = YES, _vendorCode = 2319 */
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 2319;
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
    if(_var_csg_access_mode)
    {
        [_var_csg_access_mode beforeEncode];
        [arr addObject:_var_csg_access_mode];
    }
    if(_var_csg_membership_indication)
    {
        [_var_csg_membership_indication beforeEncode];
        [arr addObject:_var_csg_membership_indication];
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"mandatory\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[csg-id]",webName];
        [UMDiameterAvpCSG_ID appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[csg-access-mode]",webName];
        [UMDiameterAvpCSG_Access_Mode appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[csg-membership-indication]",webName];
        [UMDiameterAvpCSG_Membership_Indication appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"CSG-ID"] = [_var_csg_id objectValue];
	dict[@"CSG-Access-Mode"] = [_var_csg_access_mode objectValue];
	dict[@"CSG-Membership-Indication"] = [_var_csg_membership_indication objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"user-csg-information";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCSG_ID definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCSG_Access_Mode definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpCSG_Membership_Indication definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

