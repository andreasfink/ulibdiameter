//
//  UMDiameterAvpSGSN_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 22:48:02.389000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSGSN_Location_Information.h"
#import "UMDiameterAvpCell_Global_Identity.h"
#import "UMDiameterAvpLocation_Area_Identity.h"
#import "UMDiameterAvpService_Area_Identity.h"
#import "UMDiameterAvpRouting_Area_Identity.h"
#import "UMDiameterAvpGeographical_Information.h"
#import "UMDiameterAvpGeodetic_Information.h"
#import "UMDiameterAvpCurrent_Location_Retrieved.h"
#import "UMDiameterAvpAge_Of_Location_Information.h"
#import "UMDiameterAvpUser_CSG_Information.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSGSN_Location_Information


- (NSString *)avpType
{
    return @"SGSN-Location-Information";
}

- (uint32_t)avpCode
{
    return 1601;
}

+ (uint32_t)avpCode
{
    return 1601;
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
    if(_var_cell_global_identity)
    {
        [arr addObject:_var_cell_global_identity];
    }
    if(_var_location_area_identity)
    {
        [arr addObject:_var_location_area_identity];
    }
    if(_var_service_area_identity)
    {
        [arr addObject:_var_service_area_identity];
    }
    if(_var_routing_area_identity)
    {
        [arr addObject:_var_routing_area_identity];
    }
    if(_var_geographical_information)
    {
        [arr addObject:_var_geographical_information];
    }
    if(_var_geodetic_information)
    {
        [arr addObject:_var_geodetic_information];
    }
    if(_var_current_location_retrieved)
    {
        [arr addObject:_var_current_location_retrieved];
    }
    if(_var_age_of_location_information)
    {
        [arr addObject:_var_age_of_location_information];
    }
    if(_var_user_csg_information)
    {
        [arr addObject:_var_user_csg_information];
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
            _var_cell_global_identity = [[UMDiameterAvpCell_Global_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_cell_global_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Area_Identity avpCode])
        {
            _var_location_area_identity = [[UMDiameterAvpLocation_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_location_area_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Area_Identity avpCode])
        {
            _var_service_area_identity = [[UMDiameterAvpService_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_service_area_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpRouting_Area_Identity avpCode])
        {
            _var_routing_area_identity = [[UMDiameterAvpRouting_Area_Identity alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_routing_area_identity];
        }
        else if(avp.avpCode == [UMDiameterAvpGeographical_Information avpCode])
        {
            _var_geographical_information = [[UMDiameterAvpGeographical_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_geographical_information];
        }
        else if(avp.avpCode == [UMDiameterAvpGeodetic_Information avpCode])
        {
            _var_geodetic_information = [[UMDiameterAvpGeodetic_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_geodetic_information];
        }
        else if(avp.avpCode == [UMDiameterAvpCurrent_Location_Retrieved avpCode])
        {
            _var_current_location_retrieved = [[UMDiameterAvpCurrent_Location_Retrieved alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_current_location_retrieved];
        }
        else if(avp.avpCode == [UMDiameterAvpAge_Of_Location_Information avpCode])
        {
            _var_age_of_location_information = [[UMDiameterAvpAge_Of_Location_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_age_of_location_information];
        }
        else if(avp.avpCode == [UMDiameterAvpUser_CSG_Information avpCode])
        {
            _var_user_csg_information = [[UMDiameterAvpUser_CSG_Information alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_user_csg_information];
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

