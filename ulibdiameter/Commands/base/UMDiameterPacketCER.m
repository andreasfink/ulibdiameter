//
//  UMDiameterPacketCER.m
//  ulibdiameter
//
//  Created by afink on 2019-11-01 14:37:25.859000
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


    [UMDiameterAvpOrigin_Host appendWebDiameterParameters:s webName:@"origin-host"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_Realm appendWebDiameterParameters:s webName:@"origin-realm"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpHost_IP_Address appendWebDiameterParameters:s webName:@"host-ip-address[]"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpVendor_Id appendWebDiameterParameters:s webName:@"vendor-id"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpProduct_Name appendWebDiameterParameters:s webName:@"product-name"  comment:@"" css:@"mandatory"];

    [UMDiameterAvpOrigin_State_Id appendWebDiameterParameters:s webName:@"origin-state-id"  comment:@"" css:@"optional"];

    [UMDiameterAvpSupported_Vendor_Id appendWebDiameterParameters:s webName:@"supported-vendor-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpAuth_Application_Id appendWebDiameterParameters:s webName:@"auth-application-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpInband_Security_Id appendWebDiameterParameters:s webName:@"inband-security-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpAcct_Application_Id appendWebDiameterParameters:s webName:@"acct-application-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpVendor_Specific_Application_Id appendWebDiameterParameters:s webName:@"vendor-specific-application-id[]"  comment:@"" css:@"optional"];

    [UMDiameterAvpFirmware_Revision appendWebDiameterParameters:s webName:@"firmware-revision"  comment:@"" css:@"optional"];

}

- (void)afterDecode
{
    for(UMDiameterAvp *avp in _packet_avps)
    {
        if([avp isKindOfClass:[UMDiameterAvpOrigin_Host class]])
        {
            _var_origin_host = (UMDiameterAvpOrigin_Host *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_Realm class]])
        {
            _var_origin_realm = (UMDiameterAvpOrigin_Realm *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpHost_IP_Address class]])
        {
            if(_var_host_ip_address == NULL)
            {
                _var_host_ip_address = (NSArray<UMDiameterAvpHost_IP_Address *>*)@[avp];
            }
            else
            {
                _var_host_ip_address = [_var_host_ip_address arrayByAddingObject:(UMDiameterAvpHost_IP_Address *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpVendor_Id class]])
        {
            _var_vendor_id = (UMDiameterAvpVendor_Id *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpProduct_Name class]])
        {
            _var_product_name = (UMDiameterAvpProduct_Name *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpOrigin_State_Id class]])
        {
            _var_origin_state_id = (UMDiameterAvpOrigin_State_Id *)avp;
        }
        else if([avp isKindOfClass:[UMDiameterAvpSupported_Vendor_Id class]])
        {
            if(_var_supported_vendor_id == NULL)
            {
                _var_supported_vendor_id = (NSArray<UMDiameterAvpSupported_Vendor_Id *>*)@[avp];
            }
            else
            {
                _var_supported_vendor_id = [_var_supported_vendor_id arrayByAddingObject:(UMDiameterAvpSupported_Vendor_Id *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpAuth_Application_Id class]])
        {
            if(_var_auth_application_id == NULL)
            {
                _var_auth_application_id = (NSArray<UMDiameterAvpAuth_Application_Id *>*)@[avp];
            }
            else
            {
                _var_auth_application_id = [_var_auth_application_id arrayByAddingObject:(UMDiameterAvpAuth_Application_Id *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpInband_Security_Id class]])
        {
            if(_var_inband_security_id == NULL)
            {
                _var_inband_security_id = (NSArray<UMDiameterAvpInband_Security_Id *>*)@[avp];
            }
            else
            {
                _var_inband_security_id = [_var_inband_security_id arrayByAddingObject:(UMDiameterAvpInband_Security_Id *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpAcct_Application_Id class]])
        {
            if(_var_acct_application_id == NULL)
            {
                _var_acct_application_id = (NSArray<UMDiameterAvpAcct_Application_Id *>*)@[avp];
            }
            else
            {
                _var_acct_application_id = [_var_acct_application_id arrayByAddingObject:(UMDiameterAvpAcct_Application_Id *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpVendor_Specific_Application_Id class]])
        {
            if(_var_vendor_specific_application_id == NULL)
            {
                _var_vendor_specific_application_id = (NSArray<UMDiameterAvpVendor_Specific_Application_Id *>*)@[avp];
            }
            else
            {
                _var_vendor_specific_application_id = [_var_vendor_specific_application_id arrayByAddingObject:(UMDiameterAvpVendor_Specific_Application_Id *)avp];
            }
        }
        else if([avp isKindOfClass:[UMDiameterAvpFirmware_Revision class]])
        {
            _var_firmware_revision = (UMDiameterAvpFirmware_Revision *)avp;
        }
        else
        {
            if(_unknown_avps == NULL)
            {
                _unknown_avps = [[UMSynchronizedArray alloc]init];
            }
            [_unknown_avps addObject:avp];
        }
    }
}

- (id)objectValue
{
	UMSynchronizedSortedDictionary *dict = [[UMSynchronizedSortedDictionary alloc]init];
	dict[@"Origin-Host"] = [_var_origin_host objectValue];
	dict[@"Origin-Realm"] = [_var_origin_realm objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_host_ip_address.count>0)
		{
			for(UMDiameterAvp *avp in _var_host_ip_address)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Host-IP-Address"] = arr;
		}
	}
	dict[@"Vendor-Id"] = [_var_vendor_id objectValue];
	dict[@"Product-Name"] = [_var_product_name objectValue];
	dict[@"Origin-State-Id"] = [_var_origin_state_id objectValue];
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_supported_vendor_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_supported_vendor_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Supported-Vendor-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_auth_application_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_auth_application_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Auth-Application-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_inband_security_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_inband_security_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Inband-Security-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_acct_application_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_acct_application_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Acct-Application-Id"] = arr;
		}
	}
	{
		NSMutableArray *arr = [[NSMutableArray alloc]init];
		if(_var_vendor_specific_application_id.count>0)
		{
			for(UMDiameterAvp *avp in _var_vendor_specific_application_id)
			{
				[arr addObject:[avp objectValue]];
			}
			dict[@"Vendor-Specific-Application-Id"] = arr;
		}
	}
	dict[@"Firmware-Revision"] = [_var_firmware_revision objectValue];
	return dict;
}

+ (NSString *)webJsonDefintion
{
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_Host definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_Realm definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpHost_IP_Address definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(YES);
        def[@"minimum-count"]=@(1);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpProduct_Name definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(YES);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpOrigin_State_Id definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpSupported_Vendor_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAuth_Application_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpInband_Security_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpAcct_Application_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpVendor_Specific_Application_Id definition];
        def[@"multiple"]=@(YES);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }
    {
        UMSynchronizedSortedDictionary *def =  [UMDiameterAvpFirmware_Revision definition];
        def[@"multiple"]=@(NO);
        def[@"mandatory"]=@(NO);
        [arr addObject:def];
    }

    UMSynchronizedSortedDictionary *commandDef = [[UMSynchronizedSortedDictionary alloc]init];
    commandDef[@"command-name"] = @"CER";
    commandDef[@"web-name"] = @"cer";
    commandDef[@"command-number"] = @(257);
    commandDef[@"application-id"] = @(0);
    commandDef[@"rbit"] = @(YES);
    commandDef[@"ebit"] = @(NO);
    commandDef[@"pbit"] = @(NO);
    commandDef[@"tbit"] = @(NO);
    commandDef[@"fields"] = arr;

    return [commandDef jsonString];
}

@end

