//
//  UMDiameterAvpIMSI_Group_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
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


- (void)afterDecode
{
    NSArray *avps = [self array];

    NSMutableArray *knownAVPs  = [[NSMutableArray alloc]init];
    NSMutableArray *unknownAVPs;

    for(UMDiameterAvp *avp in avps)
    {
        if(avp.avpCode == [UMDiameterAvpGroup_Service_Id  avpCode])
        {
            _var_group_service_id = [[UMDiameterAvpGroup_Service_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_group_service_id];
        }
        else if(avp.avpCode == [UMDiameterAvpGroup_PLMN_Id avpCode])
        {
            _var_group_plmn_id = [[UMDiameterAvpGroup_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_group_plmn_id];
        }
        else if(avp.avpCode == [UMDiameterAvpLocal_Group_Id avpCode])
        {
            _var_local_group_id = [[UMDiameterAvpLocal_Group_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_local_group_id];
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

