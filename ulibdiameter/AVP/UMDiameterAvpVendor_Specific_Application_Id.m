//
//  UMDiameterAvpVendor_Specific_Application_Id.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpVendorId.h"
#import "UMDiameterAvpAuthApplicationId.h"

@implementation UMDiameterAvpVendor_Specific_Application_Id


- (NSString *)avpType
{
    return @"Vendor-Specific-Application-Id";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_VendorSpecificApplicationId;
}

- (void)beforeEncode
{
    
    NSMutableArray *entries = [[NSMutableArray alloc]init];
    
    if(_vendor)
    {
        UMDiameterAvpVendorId *avp_vendor = [[UMDiameterAvpVendorId alloc]init];
        avp_vendor.number = _vendor;
        [entries addObject:avp_vendor];
    }
    if(_application)
    {
        UMDiameterAvpAuthApplicationId *avp_app = [[UMDiameterAvpAuthApplicationId alloc]init];
        avp_app.number = _application;
        [entries addObject:avp_app];
    }
    [self setArray:entries];
}

- (void)afterDecode
{
    NSArray *avps = [self array];
    NSMutableArray *new_avps = [[NSMutableArray alloc]init];
    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpVendorId avpCode])
        {
            UMDiameterAvpVendorId *avp1 = [[UMDiameterAvpVendorId alloc]initWithAvp:avp];
            _vendor = avp1.number;
            [new_avps addObject:avp1];
        }

        else if(avp.avpCode == [UMDiameterAvpAuthApplicationId avpCode])
        {
            UMDiameterAvpAuthApplicationId *avp1 = [[UMDiameterAvpAuthApplicationId alloc]initWithAvp:avp];
            _application = avp1.number;
            [new_avps addObject:avp1];
        }
    }
    [self setArray: new_avps];
}

- (UMDiameterAvpVendorSpecificApplicationId *)initWithString:(NSString *)str
{
    self = [super init];
    if(self)
    {
        NSArray *a = [str componentsSeparatedByString:@","];
        if(a.count >1)
        {
            NSString *a0 = a[0];
            NSString *a1 = a[1];
            _vendor = [[NSNumber alloc]initWithInteger:[a0 integerValue]];
            _application = [[NSNumber alloc]initWithInteger:[a1 integerValue]];
            
            NSMutableArray *entries = [[NSMutableArray alloc]init];
            UMDiameterAvpVendorId *avp_vendor = [[UMDiameterAvpVendorId alloc]initWithString:a0];
            [entries addObject:avp_vendor];

            UMDiameterAvpAuthApplicationId *avp_app = [[UMDiameterAvpAuthApplicationId alloc]initWithString:a1];
            [entries addObject:avp_app];
            [self setArray:entries];
            
            _vendor = avp_vendor.number;
            _application = avp_app.number;

        }
    }
    return self;
}

@end
