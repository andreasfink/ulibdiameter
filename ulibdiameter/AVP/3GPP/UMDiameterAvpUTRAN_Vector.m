//
//  UMDiameterAvpUTRAN_Vector.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpUTRAN_Vector.h"
#import "UMDiameterAvpItem_Number.h"
#import "UMDiameterAvpRAND.h"
#import "UMDiameterAvpXRES.h"
#import "UMDiameterAvpAUTN.h"
#import "UMDiameterAvpConfidentiality_Key.h"
#import "UMDiameterAvpIntegrity_Key.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpUTRAN_Vector


- (NSString *)avpType
{
    return @"UTRAN-Vector";
}

- (uint32_t)avpCode
{
    return 1415;
}

+ (uint32_t)avpCode
{
    return 1415;
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
    if(_var_item_number)
    {
        [arr addObject:_var_item_number];
    }
    if(_var_rand)
    {
        [arr addObject:_var_rand];
    }
    if(_var_xres)
    {
        [arr addObject:_var_xres];
    }
    if(_var_autn)
    {
        [arr addObject:_var_autn];
    }
    if(_var_confidentiality_key)
    {
        [arr addObject:_var_confidentiality_key];
    }
    if(_var_integrity_key)
    {
        [arr addObject:_var_integrity_key];
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

