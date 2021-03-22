//
//  UMDiameterAvpService_Result.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpService_Result.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpService_Result_Code.h"

@implementation UMDiameterAvpService_Result


- (NSString *)avpType
{
    return @"Service-Result";
}

- (uint32_t)avpCode
{
    return 3146;
}

+ (uint32_t)avpCode
{
    return 3146;
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
    if(_var_vendor_id.count > 0)
    {
        for(UMDiameterAvpVendor_Id *o in _var_vendor_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_service_result_code)
    {
        [_var_service_result_code beforeEncode];
        [arr addObject:_var_service_result_code];
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
            UMDiameterAvpVendor_Id *avp2 = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_vendor_id == NULL)
            {
                _var_vendor_id = @[avp2];
            }
            else
            {
                _var_vendor_id = [_var_vendor_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpService_Result_Code avpCode])
        {
            _var_service_result_code = [[UMDiameterAvpService_Result_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_result_code];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[vendor-id][]",webName];
        [UMDiameterAvpVendor_Id appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[service-result-code]",webName];
        [UMDiameterAvpService_Result_Code appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
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
		if(_var_vendor_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_vendor_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Vendor-Id"] = arr;
		}
	}
	dict[@"Service-Result-Code"] = [_var_service_result_code objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"service-result";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpService_Result_Code definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

