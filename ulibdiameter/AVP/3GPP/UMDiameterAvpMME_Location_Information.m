//
//  UMDiameterAvpMME_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 15:55:42.559000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_Location_Information.h"

@implementation UMDiameterAvpMME_Location_Information


- (NSString *)avpType
{
    return @"MME-Location-Information";
}

- (uint32_t)avpCode
{
    return 1600;
}

+ (uint32_t)avpCode
{
    return 1600;
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
    if(_e_utran_cell_global_identity)
    {
        [arr addObject:_e_utran_cell_global_identity]
    }
    if(_tracking_area_identity)
    {
        [arr addObject:_tracking_area_identity]
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
    if(_enodeb_id)
    {
        [arr addObject:_enodeb_id]
    }
    if(_extended_enodeb_id)
    {
        [arr addObject:_extended_enodeb_id]
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
        if(avp.avpCode == [UMDiameterAvpE_UTRAN_Cell_Global_Identity  avpCode])
        {
            avp = [[UMDiameterAvpE_UTRAN_Cell_Global_Identity alloc]initWithAvp:avp];
            _e_utran_cell_global_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTracking_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpTracking_Area_Identity alloc]initWithAvp:avp];
            _tracking_area_identity = avp;
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
        else if(avp.avpCode == [UMDiameterAvpeNodeB_ID avpCode])
        {
            avp = [[UMDiameterAvpeNodeB_ID alloc]initWithAvp:avp];
            _enodeb_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_eNodeB_ID avpCode])
        {
            avp = [[UMDiameterAvpExtended_eNodeB_ID alloc]initWithAvp:avp];
            _extended_enodeb_id = avp;
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

