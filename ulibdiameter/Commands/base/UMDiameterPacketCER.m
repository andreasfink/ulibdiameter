//
//  UMDiameterPacketCER.m
//  ulibdiameter
//
//  Created by afink on 2019-07-02 10:56:33.294000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketCER.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpHost_IP_Address.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpProduct_Name.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpSupported_Vendor_Id.h"
#import "UMDiameterAvpAuth_Application_Id.h"
#import "UMDiameterAvpInband_Security_Id.h"
#import "UMDiameterAvpAcct_Application_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpFirmware_Revision.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketCER


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 257;
    self.commandFlags = DIAMETER_COMMAND_FLAG_REQUEST;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_varorigin_host)
    {
        [arr addObject:_varorigin_host];
    }
    if(_varorigin_realm)
    {
        [arr addObject:_varorigin_realm];
    }
    if(_varhost_ip_address.count > 0)
    {
        for(UMDiameterAvpHost_IP_Address *o in _varhost_ip_address)
        {
            [arr addObject:o];
        }
    }
    if(_varvendor_id)
    {
        [arr addObject:_varvendor_id];
    }
    if(_varproduct_name)
    {
        [arr addObject:_varproduct_name];
    }
    if(_varorigin_state_id)
    {
        [arr addObject:_varorigin_state_id];
    }
    if(_varsupported_vendor_id.count > 0)
    {
        for(UMDiameterAvpSupported_Vendor_Id *o in _varsupported_vendor_id)
        {
            [arr addObject:o];
        }
    }
    if(_varauth_application_id.count > 0)
    {
        for(UMDiameterAvpAuth_Application_Id *o in _varauth_application_id)
        {
            [arr addObject:o];
        }
    }
    if(_varinband_security_id.count > 0)
    {
        for(UMDiameterAvpInband_Security_Id *o in _varinband_security_id)
        {
            [arr addObject:o];
        }
    }
    if(_varacct_application_id.count > 0)
    {
        for(UMDiameterAvpAcct_Application_Id *o in _varacct_application_id)
        {
            [arr addObject:o];
        }
    }
    if(_varvendor_specific_application_id.count > 0)
    {
        for(UMDiameterAvpVendor_Specific_Application_Id *o in _varvendor_specific_application_id)
        {
            [arr addObject:o];
        }
    }
    if(_varfirmware_revision)
    {
        [arr addObject:_varfirmware_revision];
    }
    if(_varavp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _varavp)
        {
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


@end

