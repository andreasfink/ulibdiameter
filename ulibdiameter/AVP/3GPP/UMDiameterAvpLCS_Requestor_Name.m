//
//  UMDiameterAvpLCS_Requestor_Name.m
//  ulibdiameter
//
//  Created by afink on 2021-03-22 10:09:01.764546
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>
#import <ulibdiameter/UMDiameterAvpLCS_Requestor_Name.h>
#import <ulibdiameter/UMDiameterAvpLCS_Requestor_Id_String.h>
#import <ulibdiameter/UMDiameterAvpLCS_Format_Indicator.h>

@implementation UMDiameterAvpLCS_Requestor_Name


- (NSString *)avpType
{
    return @"LCS-Requestor-Name";
}

- (uint32_t)avpCode
{
    return 2502;
}

+ (uint32_t)avpCode
{
    return 2502;
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
    if(_var_lcs_requestor_id_string)
    {
        [_var_lcs_requestor_id_string beforeEncode];
        [arr addObject:_var_lcs_requestor_id_string];
    }
    if(_var_lcs_format_indicator)
    {
        [_var_lcs_format_indicator beforeEncode];
        [arr addObject:_var_lcs_format_indicator];
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
        if(avp.avpCode == [UMDiameterAvpLCS_Requestor_Id_String  avpCode])
        {
            _var_lcs_requestor_id_string = [[UMDiameterAvpLCS_Requestor_Id_String alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_lcs_requestor_id_string];
        }
        else if(avp.avpCode == [UMDiameterAvpLCS_Format_Indicator avpCode])
        {
            _var_lcs_format_indicator = [[UMDiameterAvpLCS_Format_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_lcs_format_indicator];
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
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-requestor-id-string]",webName];
        [UMDiameterAvpLCS_Requestor_Id_String appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
	{
        NSString *webName2 = [NSString stringWithFormat:@"%@[lcs-format-indicator]",webName];
        [UMDiameterAvpLCS_Format_Indicator appendWebDiameterParameters:s webName:webName2 comment:NULL css:@"optional"];
    }
    [s appendString:@"</table>\n"];
    [s appendString:@"</td>\n"];
    [s appendString:@"</tr>\n"];
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"LCS-Requestor-Id-String"] = [_var_lcs_requestor_id_string objectValue];
	dict[@"LCS-Format-Indicator"] = [_var_lcs_format_indicator objectValue];
	return dict;
}

+ (id)definition
{
    UMSynchronizedSortedDictionary *avpDef = [[UMSynchronizedSortedDictionary alloc]init];
    avpDef[@"name"] = @"lcs-requestor-name";
    avpDef[@"type"] = @"Grouped";
    avpDef[@"mandatory"] = @(YES);
    avpDef[@"vendor"] = @(YES);
    avpDef[@"group"] = @(YES);
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLCS_Requestor_Id_String definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpLCS_Format_Indicator definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [entries addObject:def];
    }
    avpDef[@"members"] = entries;

    return avpDef;
}


@end

