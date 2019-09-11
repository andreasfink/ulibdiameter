//
//  UMDiameterAvpService_Result.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
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
            [arr addObject:o];
        }
    }
    if(_var_service_result_code)
    {
        [arr addObject:_var_service_result_code];
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

