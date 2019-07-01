//
//  UMDiameterAvpCSG_Subscription_Data.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpCSG_Subscription_Data


- (NSString *)avpType
{
    return @"CSG-Subscription-Data";
}

- (uint32_t)avpCode
{
    return 1436;
}

+ (uint32_t)avpCode
{
    return 1436;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_csg_id)
    {
        [arr addObject:_csg_id]
    }
    if(_expiration_date)
    {
        [arr addObject:_expiration_date]
    }
    if(_service_selection.count > 0)
    {
        for(UMDiameterAvpService_Selection *o in _service_selection)
        {
            [arr addObject:o]
        }
    }
    if(_visited_plmn_id)
    {
        [arr addObject:_visited_plmn_id]
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
        if(avp.avpCode == [UMDiameterAvpCSG_Id  avpCode])
        {
            avp = [[UMDiameterAvpCSG_Id alloc]initWithAvp:avp];
            _csg_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpExpiration_Date avpCode])
        {
            avp = [[UMDiameterAvpExpiration_Date alloc]initWithAvp:avp];
            _expiration_date = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpService_Selection avpCode])
        {
            avp = [[UMDiameterAvpService_Selection alloc]initWithAvp:avp];
            _service_selection = avp;
            [knownAVPs addObject:avp];
            if(_service_selection == NULL)
            {
                _service_selection = @[avp];
            }
            else
            {
                _service_selection = [_service_selection arrayByAddingObject:avp]
            }
        }
        else if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id avpCode])
        {
            avp = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            _visited_plmn_id = avp;
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

