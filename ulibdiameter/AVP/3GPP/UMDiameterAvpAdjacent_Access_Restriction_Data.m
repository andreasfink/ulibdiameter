//
//  UMDiameterAvpAdjacent_Access_Restriction_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdjacent_Access_Restriction_Data.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAccess_Restriction_Data.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAdjacent_Access_Restriction_Data


- (NSString *)avpType
{
    return @"Adjacent-Access-Restriction-Data";
}

- (uint32_t)avpCode
{
    return 1673;
}

+ (uint32_t)avpCode
{
    return 1673;
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
    if(_var_visited_plmn_id)
    {
        [arr addObject:_var_visited_plmn_id];
    }
    if(_var_access_restriction_data)
    {
        [arr addObject:_var_access_restriction_data];
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

