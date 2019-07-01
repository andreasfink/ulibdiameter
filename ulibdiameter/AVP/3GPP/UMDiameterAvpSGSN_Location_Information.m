//
//  UMDiameterAvpSGSN_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:53:46.309000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_cell_global_identity)
    {
        [arr addObject:_cell_global_identity]
    }
    if(_location_area_identity)
    {
        [arr addObject:_location_area_identity]
    }
    if(_service_area_identity)
    {
        [arr addObject:_service_area_identity]
    }
    if(_routing_area_identity)
    {
        [arr addObject:_routing_area_identity]
    }
    if(_geographical_information)
    {
        [arr addObject:_geographical_information]
    }
    if(_geodetic_information)
    {
        [arr addObject:_geodetic_information]
    }
    if(_current_location_retrieved)
    {
        [arr addObject:_current_location_retrieved]
    }
    if(_age_of_location_information)
    {
        [arr addObject:_age_of_location_information]
    }
    if(_user_csg_information)
    {
        [arr addObject:_user_csg_information]
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
        }
        else if(avp.avpCode == [UMDiameterAvpLocation_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpLocation_Area_Identity alloc]initWithAvp:avp];
            _location_area_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpService_Area_Identity alloc]initWithAvp:avp];
            _service_area_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpRouting_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpRouting_Area_Identity alloc]initWithAvp:avp];
            _routing_area_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGeographical_Information avpCode])
        {
            avp = [[UMDiameterAvpGeographical_Information alloc]initWithAvp:avp];
            _geographical_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGeodetic_Information avpCode])
        {
            avp = [[UMDiameterAvpGeodetic_Information alloc]initWithAvp:avp];
            _geodetic_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCurrent_Location_Retrieved avpCode])
        {
            avp = [[UMDiameterAvpCurrent_Location_Retrieved alloc]initWithAvp:avp];
            _current_location_retrieved = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAge_Of_Location_Information avpCode])
        {
            avp = [[UMDiameterAvpAge_Of_Location_Information alloc]initWithAvp:avp];
            _age_of_location_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpUser_CSG_Information avpCode])
        {
            avp = [[UMDiameterAvpUser_CSG_Information alloc]initWithAvp:avp];
            _user_csg_information = avp;
            [knownAVPs addObject:avp];
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

