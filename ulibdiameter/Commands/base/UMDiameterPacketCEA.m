//
//  UMDiameterPacketCEA.m
//  ulibdiameter
//
//  Created by afink on 2019-07-01 20:59:54.093000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//


#import "UMDiameterPacketCEA.h"
#import "UMDiameterAvpResult_Code.h"
#import "UMDiameterAvpOrigin_Host.h"
#import "UMDiameterAvpOrigin_Realm.h"
#import "UMDiameterAvpHost_IP_Address.h"
#import "UMDiameterAvpVendor_Id.h"
#import "UMDiameterAvpProduct_Name.h"
#import "UMDiameterAvpOrigin_State_Id.h"
#import "UMDiameterAvpError_Message.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpSupported_Vendor_Id.h"
#import "UMDiameterAvpAuth_Application_Id.h"
#import "UMDiameterAvpInband_Security_Id.h"
#import "UMDiameterAvpAcct_Application_Id.h"
#import "UMDiameterAvpVendor_Specific_Application_Id.h"
#import "UMDiameterAvpFirmware_Revision.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterPacketCEA

- (UMDiameterPacketCEA *)initWithString:(NSString *)s
{
    self = [super init];
    if(self)
    {
        if([self parseString:s]==NO)
        {
            return NULL;
        }
    }
    return self;
}

- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 257;
    self.commandFlags = 0;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_result_code)
    {
        [arr addObject:_result_code]
    }
    if(_origin_host)
    {
        [arr addObject:_origin_host]
    }
    if(_origin_realm)
    {
        [arr addObject:_origin_realm]
    }
    if(_host_ip_address.count > 0)
    {
        for(UMDiameterAvpHost_IP_Address *o in _host_ip_address)
        {
            [arr addObject:o]
        }
    }
    if(_vendor_id)
    {
        [arr addObject:_vendor_id]
    }
    if(_product_name)
    {
        [arr addObject:_product_name]
    }
    if(_origin_state_id)
    {
        [arr addObject:_origin_state_id]
    }
    if(_error_message)
    {
        [arr addObject:_error_message]
    }
    if(_failed_avp)
    {
        [arr addObject:_failed_avp]
    }
    if(_supported_vendor_id.count > 0)
    {
        for(UMDiameterAvpSupported_Vendor_Id *o in _supported_vendor_id)
        {
            [arr addObject:o]
        }
    }
    if(_auth_application_id.count > 0)
    {
        for(UMDiameterAvpAuth_Application_Id *o in _auth_application_id)
        {
            [arr addObject:o]
        }
    }
    if(_inband_security_id.count > 0)
    {
        for(UMDiameterAvpInband_Security_Id *o in _inband_security_id)
        {
            [arr addObject:o]
        }
    }
    if(_acct_application_id.count > 0)
    {
        for(UMDiameterAvpAcct_Application_Id *o in _acct_application_id)
        {
            [arr addObject:o]
        }
    }
    if(_vendor_specific_application_id.count > 0)
    {
        for(UMDiameterAvpVendor_Specific_Application_Id *o in _vendor_specific_application_id)
        {
            [arr addObject:o]
        }
    }
    if(_firmware_revision)
    {
        [arr addObject:_firmware_revision]
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


@end

