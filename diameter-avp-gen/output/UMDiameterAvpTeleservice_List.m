//
//  UMDiameterAvpTeleservice_List.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpGrouped.h"

@implementation UMDiameterAvpTeleservice_List


- (NSString *)avpType
{
    return @"Teleservice-List";
}

- (uint32_t)avpCode
{
    return 1486;
}

+ (uint32_t)avpCode
{
    return 1486;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Vendor | UMDiameterAvpFlag_Mandatory;
    _avpVendorId = 10415;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_ts_code.count > 0)
    {
        for(UMDiameterAvpTS_Code *o in _ts_code)
        {
            [arr addObject:o]
        }
    }
    if(_avp)
    {
        [arr addObject:_avp]
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
        if(avp.avpCode == [UMDiameterAvpTS_Code  avpCode])
        {
            avp = [[UMDiameterAvpTS_Code alloc]initWithAvp:avp];
            _ts_code = avp;
            [knownAVPs addObject:avp];
            if(_ts_code == NULL)
            {
                _ts_code = @[avp];
            }
            else
            {
                _ts_code = [_ts_code arrayByAddingObject:avp]
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

