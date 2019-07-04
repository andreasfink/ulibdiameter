//
//  UMDiameterAvpVendor_Specific_Application_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:39:39.689000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpAuth_Application_Id.h"
#import "UMDiameterAvpAcct_Application_Id.h"

@implementation UMDiameterAvpVendor_Specific_Application_Id


- (NSString *)avpType
{
    return @"Vendor-Specific-Application-Id";
}

- (uint32_t)avpCode
{
    return 260;
}

+ (uint32_t)avpCode
{
    return 260;
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
    if(_var_auth_application_id)
    {
        [arr addObject:_var_auth_application_id];
    }
    if(_var_acct_application_id)
    {
        [arr addObject:_var_acct_application_id];
    }
    [self setArray:arr];
}


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

