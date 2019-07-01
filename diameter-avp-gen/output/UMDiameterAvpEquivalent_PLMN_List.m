//
//  UMDiameterAvpEquivalent_PLMN_List.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpEquivalent_PLMN_List


- (NSString *)avpType
{
    return @"Equivalent-PLMN-List";
}

- (uint32_t)avpCode
{
    return 1637;
}

+ (uint32_t)avpCode
{
    return 1637;
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
    if(_visited_plmn_id.count > 0)
    {
        for(UMDiameterAvpVisited_PLMN_Id *o in _visited_plmn_id)
        {
            [arr addObject:o]
        }
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
        if(avp.avpCode == [UMDiameterAvpVisited_PLMN_Id  avpCode])
        {
            avp = [[UMDiameterAvpVisited_PLMN_Id alloc]initWithAvp:avp];
            _visited_plmn_id = avp;
            [knownAVPs addObject:avp];
            if(_visited_plmn_id == NULL)
            {
                _visited_plmn_id = @[avp];
            }
            else
            {
                _visited_plmn_id = [_visited_plmn_id arrayByAddingObject:avp]
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
    _avp = unknownAVPs;
    [knownAVPs addObject:[_avp copy]];
    [self setArray:knownAVPs];
}


@end

