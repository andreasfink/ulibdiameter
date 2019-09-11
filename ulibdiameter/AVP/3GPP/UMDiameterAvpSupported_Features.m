//
//  UMDiameterAvpSupported_Features.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Features.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpFeature_List_ID.h"
#import "UMDiameterAvpFeature_List.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSupported_Features


- (NSString *)avpType
{
    return @"Supported-Features";
}

- (uint32_t)avpCode
{
    return 628;
}

+ (uint32_t)avpCode
{
    return 628;
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
    if(_var_vendor_id)
    {
        [arr addObject:_var_vendor_id];
    }
    if(_var_feature_list_id)
    {
        [arr addObject:_var_feature_list_id];
    }
    if(_var_feature_list)
    {
        [arr addObject:_var_feature_list];
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


@end

