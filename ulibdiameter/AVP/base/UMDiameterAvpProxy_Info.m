//
//  UMDiameterAvpProxy_Info.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:39:39.689000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpProxy_Info.h"
#import "UMDiameterAvpProxy_Host.h"
#import "UMDiameterAvpProxy_State.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpProxy_Info


- (NSString *)avpType
{
    return @"Proxy-Info";
}

- (uint32_t)avpCode
{
    return 284;
}

+ (uint32_t)avpCode
{
    return 284;
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
    if(_var_proxy_host)
    {
        [arr addObject:_var_proxy_host];
    }
    if(_var_proxy_state)
    {
        [arr addObject:_var_proxy_state];
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


//- (void)afterDecode
/* skipped as there's no properties to decode */


@end

