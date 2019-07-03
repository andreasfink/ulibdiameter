//
//  UMDiameterAvpSupported_Applications.m
//  ulibdiameter
//
//  Created by afink on 2019-07-03 20:46:38.515000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpSupported_Applications.h"
#import "UMDiameterAvpAuth_Application_Id.h"
#import "UMDiameterAvpAcct_Application_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpSupported_Applications


- (NSString *)avpType
{
    return @"Supported-Applications";
}

- (uint32_t)avpCode
{
    return 631;
}

+ (uint32_t)avpCode
{
    return 631;
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
    if(_var_auth_application_id.count > 0)
    {
        for(UMDiameterAvpAuth_Application_Id *o in _var_auth_application_id)
        {
            [arr addObject:o];
        }
    }
    if(_var_acct_application_id.count > 0)
    {
        for(UMDiameterAvpAcct_Application_Id *o in _var_acct_application_id)
        {
            [arr addObject:o];
        }
    }
    if(_var_vendor_specific_application_id.count > 0)
    {
        for(UMDiameterAvpVendor_Specific_Application_Id *o in _var_vendor_specific_application_id)
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
        if(avp.avpCode == [UMDiameterAvpAuth_Application_Id  avpCode])
        {
            UMDiameterAvpAuth_Application_Id *avp2 = [[UMDiameterAvpAuth_Application_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_auth_application_id == NULL)
            {
                _var_auth_application_id = @[avp2];
            }
            else
            {
                _var_auth_application_id = [_var_auth_application_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Application_Id avpCode])
        {
            UMDiameterAvpAcct_Application_Id *avp2 = [[UMDiameterAvpAcct_Application_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_acct_application_id == NULL)
            {
                _var_acct_application_id = @[avp2];
            }
            else
            {
                _var_acct_application_id = [_var_acct_application_id arrayByAddingObject:avp2];
            }
        }
        else if(avp.avpCode == [UMDiameterAvpVendor_Specific_Application_Id avpCode])
        {
            UMDiameterAvpVendor_Specific_Application_Id *avp2 = [[UMDiameterAvpVendor_Specific_Application_Id alloc]initWithAvp:avp];
            [knownAVPs addObject:avp2];
            if(_var_vendor_specific_application_id == NULL)
            {
                _var_vendor_specific_application_id = @[avp2];
            }
            else
            {
                _var_vendor_specific_application_id = [_var_vendor_specific_application_id arrayByAddingObject:avp2];
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

