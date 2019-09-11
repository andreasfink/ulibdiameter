//
//  UMDiameterAvpMME_Location_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpMME_Location_Information.h"
#import "UMDiameterAvpE_UTRAN_Cell_Global_Identity.h"
#import "UMDiameterAvpTracking_Area_Identity.h"
#import "UMDiameterAvpGeographical_Information.h"
#import "UMDiameterAvpGeodetic_Information.h"
#import "UMDiameterAvpCurrent_Location_Retrieved.h"
#import "UMDiameterAvpAge_Of_Location_Information.h"
#import "UMDiameterAvpUser_CSG_Information.h"
#import "UMDiameterAvpeNodeB_ID.h"
#import "UMDiameterAvpExtended_eNodeB_ID.h"
#import "UMDiameterAvpAVP.h"

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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

