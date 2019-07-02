//
//  UMDiameterAvpCall_Barring_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:31.997000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpCall_Barring_Info.h"
#import "UMDiameterAvpSS_Code.h";
#import "UMDiameterAvpSS_Status.h";
#import "UMDiameterAvpAVP.h";

@implementation UMDiameterAvpCall_Barring_Info


- (NSString *)avpType
{
    return @"Call-Barring-Info";
}

- (uint32_t)avpCode
{
    return 1488;
}

+ (uint32_t)avpCode
{
    return 1488;
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
    if(_var_ss_code)
    {
        [arr addObject:_var_ss_code];
    }
    if(_var_ss_status)
    {
        [arr addObject:_var_ss_status];
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
        if(avp.avpCode == [UMDiameterAvpSS_Code  avpCode])
        {
            avp = [[UMDiameterAvpSS_Code alloc]initWithAvp:avp];
            _var_ss_code = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpSS_Status avpCode])
        {
            avp = [[UMDiameterAvpSS_Status alloc]initWithAvp:avp];
            _var_ss_status = avp;
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

