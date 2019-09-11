//
//  UMDiameterAvpIMSI_Group_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-09-10 15:04:47.947000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpIMSI_Group_Id.h"
#import "UMDiameterAvpGroup_Service_Id.h"
#import "UMDiameterAvpGroup_PLMN_Id.h"
#import "UMDiameterAvpLocal_Group_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpIMSI_Group_Id


- (NSString *)avpType
{
    return @"IMSI-Group-Id";
}

- (uint32_t)avpCode
{
    return 1675;
}

+ (uint32_t)avpCode
{
    return 1675;
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
    if(_var_group_service_id)
    {
        [arr addObject:_var_group_service_id];
    }
    if(_var_group_plmn_id)
    {
        [arr addObject:_var_group_plmn_id];
    }
    if(_var_local_group_id)
    {
        [arr addObject:_var_local_group_id];
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

