//
//  UMDiameterAvpIMSI_Group_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

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
    if(_group_service_id)
    {
        [arr addObject:_group_service_id]
    }
    if(_group_plmn_id)
    {
        [arr addObject:_group_plmn_id]
    }
    if(_local_group_id)
    {
        [arr addObject:_local_group_id]
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
        if(avp.avpCode == [UMDiameterAvpGroup_Service_Id  avpCode])
        {
            avp = [[UMDiameterAvpGroup_Service_Id alloc]initWithAvp:avp];
            _group_service_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpGroup_PLMN_Id avpCode])
        {
            avp = [[UMDiameterAvpGroup_PLMN_Id alloc]initWithAvp:avp];
            _group_plmn_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpLocal_Group_Id avpCode])
        {
            avp = [[UMDiameterAvpLocal_Group_Id alloc]initWithAvp:avp];
            _local_group_id = avp;
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

