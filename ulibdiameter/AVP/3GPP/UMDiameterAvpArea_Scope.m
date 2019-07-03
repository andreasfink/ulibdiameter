//
//  UMDiameterAvpArea_Scope.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpCell_Global_Identity  avpCode])
        {
            UMDiameterAvpCell_Global_Identity *avp2 = [[UMDiameterAvpCell_Global_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_cell_global_identity == NULL)
            {
                _var_cell_global_identity = @[avp2];
            }
            else
            {
                _var_cell_global_identity = [_var_cell_global_identity arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpE_UTRAN_Cell_Global_Identity avpCode])
        {
            UMDiameterAvpE_UTRAN_Cell_Global_Identity *avp2 = [[UMDiameterAvpE_UTRAN_Cell_Global_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_e_utran_cell_global_identity == NULL)
            {
                _var_e_utran_cell_global_identity = @[avp2];
            }
            else
            {
                _var_e_utran_cell_global_identity = [_var_e_utran_cell_global_identity arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRouting_Area_Identity avpCode])
        {
            UMDiameterAvpRouting_Area_Identity *avp2 = [[UMDiameterAvpRouting_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_routing_area_identity == NULL)
            {
                _var_routing_area_identity = @[avp2];
            }
            else
            {
                _var_routing_area_identity = [_var_routing_area_identity arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Area_Identity avpCode])
        {
            UMDiameterAvpLocation_Area_Identity *avp2 = [[UMDiameterAvpLocation_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_location_area_identity == NULL)
            {
                _var_location_area_identity = @[avp2];
            }
            else
            {
                _var_location_area_identity = [_var_location_area_identity arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTracking_Area_Identity avpCode])
        {
            UMDiameterAvpTracking_Area_Identity *avp2 = [[UMDiameterAvpTracking_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_tracking_area_identity == NULL)
            {
                _var_tracking_area_identity = @[avp2];
            }
            else
            {
                _var_tracking_area_identity = [_var_tracking_area_identity arrayByAddingObject:avp2];
            }
        }
        else
        {
             if(unknownAVPs==NULL)
             {
                 unknownAVPs = [[NSMutableArray alloc]init];
             }
             [unknownAVPs addObject:avp];
        }
    }
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

