//
//  UMDiameterAvpMME_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 11:13:54.490000
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
    if(_var_e_utran_cell_global_identity)
    {
        [arr addObject:_var_e_utran_cell_global_identity];
    }
    if(_var_tracking_area_identity)
    {
        [arr addObject:_var_tracking_area_identity];
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
    if(_var_enodeb_id)
    {
        [arr addObject:_var_enodeb_id];
    }
    if(_var_extended_enodeb_id)
    {
        [arr addObject:_var_extended_enodeb_id];
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

    NSArray        *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpE_UTRAN_Cell_Global_Identity  avpCode])
        {
            avp = [[UMDiameterAvpE_UTRAN_Cell_Global_Identity alloc]initWithAvp:avp];
            _var_e_utran_cell_global_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpTracking_Area_Identity avpCode])
        {
            avp = [[UMDiameterAvpTracking_Area_Identity alloc]initWithAvp:avp];
            _var_tracking_area_identity = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGeographical_Information avpCode])
        {
            avp = [[UMDiameterAvpGeographical_Information alloc]initWithAvp:avp];
            _var_geographical_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGeodetic_Information avpCode])
        {
            avp = [[UMDiameterAvpGeodetic_Information alloc]initWithAvp:avp];
            _var_geodetic_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpCurrent_Location_Retrieved avpCode])
        {
            avp = [[UMDiameterAvpCurrent_Location_Retrieved alloc]initWithAvp:avp];
            _var_current_location_retrieved = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAge_Of_Location_Information avpCode])
        {
            avp = [[UMDiameterAvpAge_Of_Location_Information alloc]initWithAvp:avp];
            _var_age_of_location_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpUser_CSG_Information avpCode])
        {
            avp = [[UMDiameterAvpUser_CSG_Information alloc]initWithAvp:avp];
            _var_user_csg_information = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpeNodeB_ID avpCode])
        {
            avp = [[UMDiameterAvpeNodeB_ID alloc]initWithAvp:avp];
            _var_enodeb_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExtended_eNodeB_ID avpCode])
        {
            avp = [[UMDiameterAvpExtended_eNodeB_ID alloc]initWithAvp:avp];
            _var_extended_enodeb_id = avp;
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end

