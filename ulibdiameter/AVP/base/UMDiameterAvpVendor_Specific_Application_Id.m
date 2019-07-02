//
//  UMDiameterAvpVendor_Specific_Application_Id.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 12:46:26.522000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpVendor_Id.h";
#import "UMDiameterAvpAuth_Application_Id.h";
#import "UMDiameterAvpAcct_Application_Id.h";

@implementation UMDiameterAvpVendor_Specific_Application_Id


- (NSString *)avpType
{
    return @"Vendor-Specific-Application-Id";
}

- (uint32_t)avpCode
{
    return 260;
}

+ (uint32_t)avpCode
{
    return 260;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    _avpFlags = UMDiameterAvpFlag_Mandatory;
}

- (void)beforeEncode
{
    [super beforeEncode];

    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_vendor_id)
    {
        [arr addObject:_var_vendor_id];
    }
    if(_var_auth_application_id)
    {
        [arr addObject:_var_auth_application_id];
    }
    if(_var_acct_application_id)
    {
        [arr addObject:_var_acct_application_id];
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
        if(avp.avpCode == [UMDiameterAvpVendor_Id  avpCode])
        {
            avp = [[UMDiameterAvpVendor_Id alloc]initWithAvp:avp];
            _var_vendor_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAuth_Application_Id avpCode])
        {
            avp = [[UMDiameterAvpAuth_Application_Id alloc]initWithAvp:avp];
            _var_auth_application_id = avp;
            [knownAVPs addObject:avp];
        }
        else if(avp.avpCode == [UMDiameterAvpAcct_Application_Id avpCode])
        {
            avp = [[UMDiameterAvpAcct_Application_Id alloc]initWithAvp:avp];
            _var_acct_application_id = avp;
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
    [self setArray:knownAVPs];
}


@end

