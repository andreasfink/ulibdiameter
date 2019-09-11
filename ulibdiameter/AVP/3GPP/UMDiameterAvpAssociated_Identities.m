//
//  UMDiameterAvpAssociated_Identities.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAssociated_Identities.h"
#import "UMDiameterAvpUser_Name.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAssociated_Identities


- (NSString *)avpType
{
    return @"Associated-Identities";
}

- (uint32_t)avpCode
{
    return 632;
}

+ (uint32_t)avpCode
{
    return 632;
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
    if(_var_user_name.count > 0)
    {
        for(UMDiameterAvpUser_Name *o in _var_user_name)
        {
            [arr addObject:o];
        }
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

