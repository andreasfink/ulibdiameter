//
//  UMDiameterPacketCEA.m
//  ulibdiameter
//
//  Created by afink on 2019-10-13 14:17:08.983000
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


- (void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode = 257;
    self.commandFlags = 0;
}

+ (uint32_t)commandCode
{
    return 257;
}

+ (uint32_t)defaultApplicationId
{
    return 0;
}

- (void)beforeEncode
{
    [super beforeEncode];
    NSMutableArray<UMDiameterAvp *> *arr = [[NSMutableArray alloc]init];
    if(_var_result_code)
    {
        [_var_result_code beforeEncode];
        [arr addObject:_var_result_code];
    }
    if(_var_origin_host)
    {
        [_var_origin_host beforeEncode];
        [arr addObject:_var_origin_host];
    }
    if(_var_origin_realm)
    {
        [_var_origin_realm beforeEncode];
        [arr addObject:_var_origin_realm];
    }
    if(_var_host_ip_address.count > 0)
    {
        for(UMDiameterAvpHost_IP_Address *o in _var_host_ip_address)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_vendor_id)
    {
        [_var_vendor_id beforeEncode];
        [arr addObject:_var_vendor_id];
    }
    if(_var_product_name)
    {
        [_var_product_name beforeEncode];
        [arr addObject:_var_product_name];
    }
    if(_var_origin_state_id)
    {
        [_var_origin_state_id beforeEncode];
        [arr addObject:_var_origin_state_id];
    }
    if(_var_error_message)
    {
        [_var_error_message beforeEncode];
        [arr addObject:_var_error_message];
    }
    if(_var_failed_avp)
    {
        [_var_failed_avp beforeEncode];
        [arr addObject:_var_failed_avp];
    }
    if(_var_supported_vendor_id.count > 0)
    {
        for(UMDiameterAvpSupported_Vendor_Id *o in _var_supported_vendor_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_auth_application_id.count > 0)
    {
        for(UMDiameterAvpAuth_Application_Id *o in _var_auth_application_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_inband_security_id.count > 0)
    {
        for(UMDiameterAvpInband_Security_Id *o in _var_inband_security_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_acct_application_id.count > 0)
    {
        for(UMDiameterAvpAcct_Application_Id *o in _var_acct_application_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_vendor_specific_application_id.count > 0)
    {
        for(UMDiameterAvpVendor_Specific_Application_Id *o in _var_vendor_specific_application_id)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    if(_var_firmware_revision)
    {
        [_var_firmware_revision beforeEncode];
        [arr addObject:_var_firmware_revision];
    }
    if(_var_avp.count > 0)
    {
        for(UMDiameterAvpAVP *o in _var_avp)
        {
            [o beforeEncode];
            [arr addObject:o];
        }
    }
    [self setAvps:arr];
}


- (void)setDictionaryValue:(NSDictionary *)dict
{

    if(dict[@"result-code"])
    {
        _var_result_code = [[UMDiameterAvpResult_Code alloc]init];
        _var_result_code.objectValue = dict[@"result-code"];
    }

    if(dict[@"origin-host"])
    {
        _var_origin_host = [[UMDiameterAvpOrigin_Host alloc]init];
        _var_origin_host.objectValue = dict[@"origin-host"];
    }

    if(dict[@"origin-realm"])
    {
        _var_origin_realm = [[UMDiameterAvpOrigin_Realm alloc]init];
        _var_origin_realm.objectValue = dict[@"origin-realm"];
    }

    if(dict[@"host-ip-address"])
    {
        id obj = dict[@"host-ip-address"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpHost_IP_Address *o = [[UMDiameterAvpHost_IP_Address alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_host_ip_address = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpHost_IP_Address *o = [[UMDiameterAvpHost_IP_Address alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_host_ip_address = arr;
        }
    }
    if(dict[@"vendor-id"])
    {
        _var_vendor_id = [[UMDiameterAvpVendor_Id alloc]init];
        _var_vendor_id.objectValue = dict[@"vendor-id"];
    }

    if(dict[@"product-name"])
    {
        _var_product_name = [[UMDiameterAvpProduct_Name alloc]init];
        _var_product_name.objectValue = dict[@"product-name"];
    }

    if(dict[@"origin-state-id"])
    {
        _var_origin_state_id = [[UMDiameterAvpOrigin_State_Id alloc]init];
        _var_origin_state_id.objectValue = dict[@"origin-state-id"];
    }

    if(dict[@"error-message"])
    {
        _var_error_message = [[UMDiameterAvpError_Message alloc]init];
        _var_error_message.objectValue = dict[@"error-message"];
    }

    if(dict[@"failed-avp"])
    {
        _var_failed_avp = [[UMDiameterAvpFailed_AVP alloc]init];
        _var_failed_avp.objectValue = dict[@"failed-avp"];
    }

    if(dict[@"supported-vendor-id"])
    {
        id obj = dict[@"supported-vendor-id"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpSupported_Vendor_Id *o = [[UMDiameterAvpSupported_Vendor_Id alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_supported_vendor_id = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpSupported_Vendor_Id *o = [[UMDiameterAvpSupported_Vendor_Id alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_supported_vendor_id = arr;
        }
    }
    if(dict[@"auth-application-id"])
    {
        id obj = dict[@"auth-application-id"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpAuth_Application_Id *o = [[UMDiameterAvpAuth_Application_Id alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_auth_application_id = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpAuth_Application_Id *o = [[UMDiameterAvpAuth_Application_Id alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_auth_application_id = arr;
        }
    }
    if(dict[@"inband-security-id"])
    {
        id obj = dict[@"inband-security-id"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpInband_Security_Id *o = [[UMDiameterAvpInband_Security_Id alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_inband_security_id = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpInband_Security_Id *o = [[UMDiameterAvpInband_Security_Id alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_inband_security_id = arr;
        }
    }
    if(dict[@"acct-application-id"])
    {
        id obj = dict[@"acct-application-id"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpAcct_Application_Id *o = [[UMDiameterAvpAcct_Application_Id alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_acct_application_id = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpAcct_Application_Id *o = [[UMDiameterAvpAcct_Application_Id alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_acct_application_id = arr;
        }
    }
    if(dict[@"vendor-specific-application-id"])
    {
        id obj = dict[@"vendor-specific-application-id"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpVendor_Specific_Application_Id *o = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_vendor_specific_application_id = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpVendor_Specific_Application_Id *o = [[UMDiameterAvpVendor_Specific_Application_Id alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_vendor_specific_application_id = arr;
        }
    }
    if(dict[@"firmware-revision"])
    {
        _var_firmware_revision = [[UMDiameterAvpFirmware_Revision alloc]init];
        _var_firmware_revision.objectValue = dict[@"firmware-revision"];
    }

    if(dict[@"avp"])
    {
        id obj = dict[@"avp"];
        if([obj isKindOfClass:[NSArray class]])
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            for(id entry in (NSArray *)obj)
            {
                UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
                o.objectValue = entry;
                [arr addObject:o];
            }
            _var_avp = arr;
        }
        else
        {
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            UMDiameterAvpAVP *o = [[UMDiameterAvpAVP alloc]init];
            o.objectValue = obj;
            [arr addObject:o];
            _var_avp = arr;
        }
    }
}

- (UMSynchronizedSortedDictionary *)dictionaryValue
{
    UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
    if(_var_result_code)
    {
        dict[@"result-code"] = _var_result_code.objectValue;
    }
    if(_var_origin_host)
    {
        dict[@"origin-host"] = _var_origin_host.objectValue;
    }
    if(_var_origin_realm)
    {
        dict[@"origin-realm"] = _var_origin_realm.objectValue;
    }
    if(_var_host_ip_address)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_host_ip_address)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"host-ip-address"] = arr;
    }
    if(_var_vendor_id)
    {
        dict[@"vendor-id"] = _var_vendor_id.objectValue;
    }
    if(_var_product_name)
    {
        dict[@"product-name"] = _var_product_name.objectValue;
    }
    if(_var_origin_state_id)
    {
        dict[@"origin-state-id"] = _var_origin_state_id.objectValue;
    }
    if(_var_error_message)
    {
        dict[@"error-message"] = _var_error_message.objectValue;
    }
    if(_var_failed_avp)
    {
        dict[@"failed-avp"] = _var_failed_avp.objectValue;
    }
    if(_var_supported_vendor_id)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_supported_vendor_id)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"supported-vendor-id"] = arr;
    }
    if(_var_auth_application_id)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_auth_application_id)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"auth-application-id"] = arr;
    }
    if(_var_inband_security_id)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_inband_security_id)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"inband-security-id"] = arr;
    }
    if(_var_acct_application_id)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_acct_application_id)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"acct-application-id"] = arr;
    }
    if(_var_vendor_specific_application_id)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_vendor_specific_application_id)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"vendor-specific-application-id"] = arr;
    }
    if(_var_firmware_revision)
    {
        dict[@"firmware-revision"] = _var_firmware_revision.objectValue;
    }
    if(_var_avp)
    {
        NSMutableArray *arr = [[NSMutableArray alloc]init];
        for(id entry in _var_avp)
        {
            [arr addObject:[entry objectValue]];
        }
        dict[@"avp"] = arr;
    }
    return dict;
}

+ (void)webDiameterParameters:(NSMutableString *)s
{


    [UMDiameterAvpResult_Code appendWebDiameterParameters:s webName:@"result-code"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpHost_IP_Address appendWebDiameterParameters:s webName:@"host-ip-address[]"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpVendor_Id appendWebDiameterParameters:s webName:@"vendor-id"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpProduct_Name appendWebDiameterParameters:s webName:@"product-name"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpError_Message appendWebDiameterParameters:s webName:@"error-message"  comment:@"" css:@"optional"];

    [UMDiameterAvpFailed_AVP appendWebDiameterParameters:s webName:@"failed-avp"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Vendor_Id appendWebDiameterParameters:s webName:@"supported-vendor-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Application_Id appendWebDiameterParameters:s webName:@"auth-application-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpInband_Security_Id appendWebDiameterParameters:s webName:@"inband-security-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpAcct_Application_Id appendWebDiameterParameters:s webName:@"acct-application-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpFirmware_Revision appendWebDiameterParameters:s webName:@"firmware-revision"  comment:@"" css:@"optional"];

}

@end

