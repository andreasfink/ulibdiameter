//
//  UMDiameterAvpAdjacent_PLMNs.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 11:11:14.126000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAdjacent_PLMNs.h"
#import "UMDiameterAvpVisited_PLMN_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAdjacent_PLMNs


- (NSString *)avpType
{
    return @"Adjacent-PLMNs";
}

- (uint32_t)avpCode
{
    return 1672;
}

+ (uint32_t)avpCode
{
    return 1672;
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
    if(_var_visited_plmn_id.count > 0)
    {
        for(UMDiameterAvpVisited_PLMN_Id *o in _var_visited_plmn_id)
        {
            [arr addObject:o];
        }
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
        if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id  avpCode])
        {
            UMDiameterAvpVisited_PLMN_Id *avp2 = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_visited_plmn_id == NULL)
            {
                _var_visited_plmn_id = @[avp2];
            }
            else
            {
                _var_visited_plmn_id = [_var_visited_plmn_id arrayByAddingObject:avp2];
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
    _var_avp = unknownAVPs;
    [knownAVPs addObject:[_var_avp copy]];
    [self setArray:knownAVPs];
}


@end
