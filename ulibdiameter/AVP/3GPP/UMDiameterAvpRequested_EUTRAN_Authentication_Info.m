//
//  UMDiameterAvpRequested_EUTRAN_Authentication_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpRequested_EUTRAN_Authentication_Info.h"
#import "UMDiameterAvpNumber_Of_Requested_Vectors.h"
#import "UMDiameterAvpImmediate_Response_Preferred.h"
#import "UMDiameterAvpRe_Synchronization_Info.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpRequested_EUTRAN_Authentication_Info


- (NSString *)avpType
{
    return @"Requested-EUTRAN-Authentication-Info";
}

- (uint32_t)avpCode
{
    return 1408;
}

+ (uint32_t)avpCode
{
    return 1408;
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
    if(_var_number_of_requested_vectors)
    {
        [arr addObject:_var_number_of_requested_vectors];
    }
    if(_var_immediate_response_preferred)
    {
        [arr addObject:_var_immediate_response_preferred];
    }
    if(_var_re_synchronization_info)
    {
        [arr addObject:_var_re_synchronization_info];
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

