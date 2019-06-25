//
//  UMDiameterPacket3GPP_UDR.m
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP_UDR.h"
#import "UMDiameterApplicationId.h"
#import "UMDiameterCommandCode.h"
#import "UMDiameterAvpAll.h"

@implementation UMDiameterPacket3GPP_UDR

-(void)genericInitialisation
{
    [super genericInitialisation];
    self.commandCode    =  UMDiameterCommandCode_3GPP_TS_29_272_UD;
    self.commandFlags   = DIAMETER_COMMAND_FLAG_REQUEST | DIAMETER_COMMAND_FLAG_PROXIABLE;
    self.applicationId  = UMDiameterApplicationId_3GPP_Sh;
}


- (void)beforeEncode
{
    [super beforeEncode];
    // ETSI TS 129 329 V15.1.0 (2018-07)
    // 6.1.1 User-Data-Request (UDR) Command
/*
    < User-Data -Request> ::=
    < Diameter Header: 306, REQ, PXY, 16777217 > < Session-Id >
    [ DRMP ]
    { Vendor-Specific-Application-Id } { Auth-Session-State }
    { Origin-Host }
    { Origin-Realm }
    [ Destination-Host ]
    { Destination-Realm }
    *[ Supported-Features ]
    { User-Identity }
    [ Wildcarded-Public-Identity ]
    [ Wildcarded-IMPU ]
    [ Server-Name ]
    *[ Service-Indication ]
    *{ Data-Reference }
    *[ Identity-Set ]
    [ Requested-Domain ]
    [ Current-Location ]
    *[ DSAI-Tag ]
    [ Session-Priority ]
    [ User-Name ]
    [ Requested-Nodes ]
    [ Serving-Node-Indication ]
    [ Pre-paging-Supported ]
    [ Local-Time-Zone-Indication ] [ UDR-Flags ]
    [ Call-Reference-Info ]
    [ OC-Supported-Features ]
    *[ AVP ]
    *[ Proxy-Info ]
    *[ Route-Record ]
*/
    if(_drmp.length > 0)
    {
        UMDiameterAvpDRMP *avp = [[UMDiameterAvpDRMP alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _drmp;
        [self appendAvp:avp];
    }

    if(_vendor_specific_application_id.length > 0)
    {
    }

    if(_origin_host.length > 0)
    {
        UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _origin_host;
        [self appendAvp:avp];

    }
    if(_origin_realm.length > 0)
    {
        UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _origin_realm;
        [self appendAvp:avp];

    }
    if(_destination_host.length > 0)
    {
        UMDiameterAvpDestinationHost *avp = [[UMDiameterAvpDestinationHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _destination_host;
        [self appendAvp:avp];
    }

    if(_destination_realm.length > 0)
    {
        UMDiameterAvpDestinationRealm *avp = [[UMDiameterAvpDestinationRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.stringValue = _destination_realm;
        [self appendAvp:avp];
    }
    if(_supported_features.count > 0)
    {
        for(NSString *_sf in _supported_features)
        {
            NSString *s = [_sf stringByTrimmingCharactersInSet:[UMObject whitespaceAndNewlineCharacterSet]];
            UMDiameterAvp3GPP_Supported_Features *avp = [[UMDiameterAvp3GPP_Supported_Features alloc]init];
            [avp setFlagMandatory:YES];
            avp.stringValue = s;
            [self appendAvp:avp];
        }
    }
    if(_user_identity.length > 0)
    {
    }
    if(_wildcarded_public_identity.length > 0)
    {
    }
    if(_wildcarded_impu.length > 0)
    {
    }
    if(_server_name.length > 0)
    {
    }
    if(_service_indication.count > 0)
    {
    }
    if(_data_reference.count > 0)
    {
    }
    if(_identity_set.count > 0)
    {
    }
    if(_requested_domain.length > 0)
    {
    }
    if(_current_location.length > 0)
    {
    }
    if(_dsai_tag.count>0)
    {
    }
    if(_session_priority.length > 0)
    {
    }
    if(_user_name.length > 0)
    {
    }
    if(_requested_nodes.length > 0)
    {
    }
    if(_serving_node_indication.length > 0)
    {
    }
    if(_pre_paging_supported.length > 0)
    {
    }
    if(_local_time_zone_indication.length > 0)
    {
    }
    if(_udr_flags.length > 0)
    {
    }
    if(_call_reference_info.length > 0)
    {
    }
    if(_oc_supported_features.length > 0)
    {
    }
    if(_additional_avp.count > 0)
    {
    }
    if(_proxy_info.count > 0)
    {
    }
    if(_route_record.count>0)
    {
    }
}


@end
