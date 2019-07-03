//
//  UMDiameterAvpTerminal_Information.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpTerminal_Information.h"
#import "UMDiameterAvpIMEI.h"
#import "UMDiameterAvp3GPP2_MEID.h"
#import "UMDiameterAvpSoftware_Version.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpTerminal_Information


- (NSString *)avpType
{
    return @"Terminal-Information";
}

- (uint32_t)avpCode
{
    return 1401;
}

+ (uint32_t)avpCode
{
    return 1401;
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
    if(_var_imei)
    {
        [arr addObject:_var_imei];
    }
    if(_var_3gpp2_meid)
    {
        [arr addObject:_var_3gpp2_meid];
    }
    if(_var_software_version)
    {
        [arr addObject:_var_software_version];
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
        if(avp.avpCode == [UMDiameterAvpIMEI  avpCode])
        {
            _var_imei = [[UMDiameterAvpIMEI alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_imei];
        }
        else if(avp.avpCode == [UMDiameterAvp3GPP2_MEID avpCode])
        {
            _var_3gpp2_meid = [[UMDiameterAvp3GPP2_MEID alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_3gpp2_meid];
        }
        else if(avp.avpCode == [UMDiameterAvpSoftware_Version avpCode])
        {
            _var_software_version = [[UMDiameterAvpSoftware_Version alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_software_version];
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

