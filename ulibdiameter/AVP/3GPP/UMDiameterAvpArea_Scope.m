//
//  UMDiameterAvpArea_Scope.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpArea_Scope.h"

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
    if(_cell_global_identity.count > 0)
    {
        for(UMDiameterAvpCell_Global_Identity *o in _cell_global_identity)
        {
            [arr addObject:o]
        }
    }
    if(_e_utran_cell_global_identity.count > 0)
    {
        for(UMDiameterAvpE_UTRAN_Cell_Global_Identity *o in _e_utran_cell_global_identity)
        {
            [arr addObject:o]
        }
    }
    if(_routing_area_identity.count > 0)
    {
        for(UMDiameterAvpRouting_Area_Identity *o in _routing_area_identity)
        {
            [arr addObject:o]
        }
    }
    if(_location_area_identity.count > 0)
    {
        for(UMDiameterAvpLocation_Area_Identity *o in _location_area_identity)
        {
            [arr addObject:o]
        }
    }
    if(_tracking_area_identity.count > 0)
    {
        for(UMDiameterAvpTracking_Area_Identity *o in _tracking_area_identity)
        {
            [arr addObject:o]
        }
    }
    if(_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _avp)
        {
            [arr addObject:o]
        }
    }
    [self setAvps:arr];
}


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAVP *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpCell_Global_Identity  avpCode])
        {
            avp = [[UMDiameterAvpCell_Global_Identity alloc]initWithAvp:avp];
            _cell_global_identity = avp;
            [knownAVPs addObject:avp];
            if(_cell_global_identity == NULL)
            {
                _cell_global_identity = @[avp];
            }
            else
            {
                _cell_global_identity = [_cell_global_identity arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpE_UTRAN_Cell_Global_Identity avpCode])
        {
            avp = [[UMDiameterAvpE_UTRAN_Cell_Global_Identity alloc]initWithAvp:avp];
            _e_utran_cell_global_identity = avp;
            [knownAVPs addObject:avp];
            if(_e_utran_cell_global_identity == NULL)
            {
                _e_utran_cell_global_identity = @[avp];
            }
            else
            {
                _e_utran_cell_global_identity = [_e_utran_cell_global_identity arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpRouting_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpRouting_Area_Identity alloc]initWithAvp:avp];
            _routing_area_identity = avp;
            [knownAVPs addObject:avp];
            if(_routing_area_identity == NULL)
            {
                _routing_area_identity = @[avp];
            }
            else
            {
                _routing_area_identity = [_routing_area_identity arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpLocation_Area_Identity alloc]initWithAvp:avp];
            _location_area_identity = avp;
            [knownAVPs addObject:avp];
            if(_location_area_identity == NULL)
            {
                _location_area_identity = @[avp];
            }
            else
            {
                _location_area_identity = [_location_area_identity arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpTracking_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpTracking_Area_Identity alloc]initWithAvp:avp];
            _tracking_area_identity = avp;
            [knownAVPs addObject:avp];
            if(_tracking_area_identity == NULL)
            {
                _tracking_area_identity = @[avp];
            }
            else
            {
                _tracking_area_identity = [_tracking_area_identity arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

