//
//  UMDiameterAvpTeleservice_List.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 00:13:25.004000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTeleservice_List.h"
#import "UMDiameterAvpTS_Code.h"
#import "UMDiameterAvpAVP.h"

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
    if(_var_ts_code.count > 0)
    {
        for(UMDiameterAvpTS_Code *o in _var_ts_code)
        {
            [arr addObject:o];
        }
    }
    if(_var_avp)
    {
        [arr addObject:_var_avp];
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
        if(avp.avpCode == [UMDiameterAvpTS_Code  avpCode])
        {
            UMDiameterAvpTS_Code *avp2 = [[UMDiameterAvpTS_Code alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_ts_code == NULL)
            {
                _var_ts_code = @[avp2];
            }
            else
            {
                _var_ts_code = [_var_ts_code arrayByAddingObject:avp];
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

