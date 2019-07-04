//
//  UMDiameterAvpExperimental_Result.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:32:11.865000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpExperimental_Result.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpExperimental_Result_Code.h"

@implementation UMDiameterAvpExperimental_Result


- (NSString *)avpType
{
    return @"Experimental-Result";
}

- (uint32_t)avpCode
{
    return 297;
}

+ (uint32_t)avpCode
{
    return 297;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_vendor_id)
    {
        [arr addObject:_var_vendor_id];
    }
    if(_var_experimental_result_code)
    {
        [arr addObject:_var_experimental_result_code];
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

