//
//  UMDiameterAvpAPN_Configuration_Profile.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 14:54:47.208000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpAPN_Configuration_Profile.h"
#import "UMDiameterAvpContext_Identifier.h"
#import "UMDiameterAvpAdditional_Context_Identifier.h"
#import "UMDiameterAvpAll_APN_Configurations_Included_Indicator.h"
#import "UMDiameterAvpAPN_Configuration.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpAPN_Configuration_Profile


- (NSString *)avpType
{
    return @"APN-Configuration-Profile";
}

- (uint32_t)avpCode
{
    return 1429;
}

+ (uint32_t)avpCode
{
    return 1429;
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
    if(_var_context_identifier)
    {
        [arr addObject:_var_context_identifier];
    }
    if(_var_additional_context_identifier)
    {
        [arr addObject:_var_additional_context_identifier];
    }
    if(_var_all_apn_configurations_included_indicator)
    {
        [arr addObject:_var_all_apn_configurations_included_indicator];
    }
    if(_var_apn_configuration.count > 0)
    {
        for(UMDiameterAvpAPN_Configuration *o in _var_apn_configuration)
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
        if(avp.avpCode == [UMDiameterAvpContext_Identifier  avpCode])
        {
            _var_context_identifier = [[UMDiameterAvpContext_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_context_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpAdditional_Context_Identifier avpCode])
        {
            _var_additional_context_identifier = [[UMDiameterAvpAdditional_Context_Identifier alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_additional_context_identifier];
        }
        else if(avp.avpCode == [UMDiameterAvpAll_APN_Configurations_Included_Indicator avpCode])
        {
            _var_all_apn_configurations_included_indicator = [[UMDiameterAvpAll_APN_Configurations_Included_Indicator alloc]initWithAvp:avp];
            [knownAVPs addObject:_var_all_apn_configurations_included_indicator];
        }
        else if(avp.avpCode == [UMDiameterAvpAPN_Configuration avpCode])
        {
            avp = [[UMDiameterAvpAPN_Configuration alloc]initWithAvp:avp];
            _var_apn_configuration = avp;
            [knownAVPs addObject:avp];
            if(_var_apn_configuration == NULL)
            {
                _var_apn_configuration = @[avp];
            }
            else
            {
                _var_apn_configuration = [_var_apn_configuration arrayByAddingObject:avp]
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

