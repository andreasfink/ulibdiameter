//
//  UMDiameterAvpRestoration_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRestoration_Info.h"
#import "UMDiameterAvpPath.h"
#import "UMDiameterAvpContact.h"
#import "UMDiameterAvpInitial_CSeq_Sequence_Number.h"
#import "UMDiameterAvpSubscription_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpRestoration_Info


- (NSString *)avpType
{
    return @"Restoration-Info";
}

- (uint32_t)avpCode
{
    return 649;
}

+ (uint32_t)avpCode
{
    return 649;
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
    if(_var_path)
    {
        [arr addObject:_var_path];
    }
    if(_var_contact)
    {
        [arr addObject:_var_contact];
    }
    if(_var_initial_cseq_sequence_number)
    {
        [arr addObject:_var_initial_cseq_sequence_number];
    }
    if(_var_subscription_info)
    {
        [arr addObject:_var_subscription_info];
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

