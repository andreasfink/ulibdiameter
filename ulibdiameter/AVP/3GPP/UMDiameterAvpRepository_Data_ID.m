//
//  UMDiameterAvpRepository_Data_ID.m
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:45:21.078000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRepository_Data_ID.h"
#import "UMDiameterAvpService_Indication.h"
#import "UMDiameterAvpSequence_Number.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpRepository_Data_ID


- (NSString *)avpType
{
    return @"Repository-Data-ID";
}

- (uint32_t)avpCode
{
    return 715;
}

+ (uint32_t)avpCode
{
    return 715;
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
    if(_var_service_indication)
    {
        [_var_service_indication beforeEncode];
        [arr addObject:_var_service_indication];
    }
    if(_var_sequence_number)
    {
        [_var_sequence_number beforeEncode];
        [arr addObject:_var_sequence_number];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-indication]",webName];
        [UMDiameterAvpService_Indication appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[sequence-number]",webName];
        [UMDiameterAvpSequence_Number appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"mandatory"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Service-Indication"] = [_var_service_indication objectValue];
	dict[@"Sequence-Number"] = [_var_sequence_number objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"repository-data-id";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(NO);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    [entries addObject:[UMDiameterAvpService_Indication definition]];
    [entries addObject:[UMDiameterAvpSequence_Number definition]];
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

