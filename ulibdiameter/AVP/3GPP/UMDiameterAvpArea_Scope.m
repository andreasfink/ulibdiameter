//
//  UMDiameterAvpArea_Scope.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Scope.h"
#import "UMDiameterAvpCell_Global_Identity.h"
#import "UMDiameterAvpE_UTRAN_Cell_Global_Identity.h"
#import "UMDiameterAvpRouting_Area_Identity.h"
#import "UMDiameterAvpLocation_Area_Identity.h"
#import "UMDiameterAvpTracking_Area_Identity.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpArea_Scope


- (NSString *)avpType
{
    return @"Area-Scope";
}

- (uint32_t)avpCode
{
    return 1624;
}

+ (uint32_t)avpCode
{
    return 1624;
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
    if(_var_cell_global_identity.count > 0)
    {
        for(UMDiameterAvpCell_Global_Identity *o in _var_cell_global_identity)
        {
            [arr addObject:o];
        }
    }
    if(_var_e_utran_cell_global_identity.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Cell_Global_Identity *o in _var_e_utran_cell_global_identity)
        {
            [arr addObject:o];
        }
    }
    if(_var_routing_area_identity.count > 0)
    {
        for(UMDiameterAvpRouting_Area_Identity *o in _var_routing_area_identity)
        {
            [arr addObject:o];
        }
    }
    if(_var_location_area_identity.count > 0)
    {
        for(UMDiameterAvpLocation_Area_Identity *o in _var_location_area_identity)
        {
            [arr addObject:o];
        }
    }
    if(_var_tracking_area_identity.count > 0)
    {
        for(UMDiameterAvpTracking_Area_Identity *o in _var_tracking_area_identity)
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

