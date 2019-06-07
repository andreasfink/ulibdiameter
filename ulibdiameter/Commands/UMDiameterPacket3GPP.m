//
//  UMDiameterPacket3GPP.m
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP.h"

#import "UMDiameterAvpOriginHost.h"
#import "UMDiameterAvpOriginRealm.h"
#import "UMDiameterAvpDestinationHost.h"
#import "UMDiameterAvpDestinationRealm.h"

@implementation UMDiameterPacket3GPP


-(void)genericInitialisation
{
    [super genericInitialisation];
}


/*  things to think of:
    what if a user adds AVP's himself
    when and where do we add them to avoid dups?
 */

- (void)beforeEncode
{
    if(_session_id)
    {
    }
    if(_origin_host)
    {
        // { Origin-Host }
        UMDiameterAvpOriginHost *avp = [[UMDiameterAvpOriginHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_origin_host dataUsingEncoding:NSUTF8StringEncoding];
        [self appendAvp:avp];
    }
    if(_origin_realm)
    {
        UMDiameterAvpOriginRealm *avp = [[UMDiameterAvpOriginRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_origin_realm  dataUsingEncoding:NSUTF8StringEncoding];
        [self appendAvp:avp];
    }


    if(_destination_host.length > 0)
    {
        // { Destination-Host }
        UMDiameterAvpDestinationHost *avp = [[UMDiameterAvpDestinationHost alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_destination_host dataUsingEncoding:NSUTF8StringEncoding];
        [self appendAvp:avp];
    }
    // { Restination-Realm }
    if(_destination_realm.length > 0)
    {
        UMDiameterAvpDestinationRealm *avp = [[UMDiameterAvpDestinationRealm alloc]init];
        [avp setFlagMandatory:YES];
        avp.avpData =[_destination_realm  dataUsingEncoding:NSUTF8StringEncoding];
        [self appendAvp:avp];
    }

}


@end
