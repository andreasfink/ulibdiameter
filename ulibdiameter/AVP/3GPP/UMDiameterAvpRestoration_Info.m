//
//  UMDiameterAvpRestoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-10-01 17:51:40.729000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRestoration_Info.h"
#import "UMDiameterAvpPath.h"
#import "UMDiameterAvpContact.h"
#import "UMDiameterAvpInitial_CSeq_Sequence_Number.h"
#import "UMDiameterAvpSubscription_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpRestoration_Info


- (NSString *)avpType
{
    return @"Restoration-Info";
}

- (uint32_t)avpCode
{
    return 649;
}

+ (uint32_t)avpCode
{
    return 649;
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
    if(_var_path)
    {
        [arr addObject:_var_path];
    }
    if(_var_contact)
    {
        [arr addObject:_var_contact];
    }
    if(_var_initial_cseq_sequence_number)
    {
        [arr addObject:_var_initial_cseq_sequence_number];
    }
    if(_var_subscription_info)
    {
        [arr addObject:_var_subscription_info];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [arr addObject:o];
        }
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */

+ (void)appendWebDiameterParameters:(NSMutableString *)s webName:(NSString *)webName  comment:(NSString *)webComment css:(NSString *)cssClass
{
    [s appendString:@"<tr>\n"];
    [s appendFormat:@"<td class=\"optional\">%@\n",webName];
    [s appendString:@"</td>\n"];
    [s appendString:@"<td>\n"];
    [s appendString:@"<table class=\"avp-grouped\">\n"];
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[path]",webName];
        [UMDiameterAvpPath appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[contact]",webName];
        [UMDiameterAvpContact appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[initial-cseq-sequence-number]",webName];
        [UMDiameterAvpInitial_CSeq_Sequence_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[subscription-info]",webName];
        [UMDiameterAvpSubscription_Info appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

@end

