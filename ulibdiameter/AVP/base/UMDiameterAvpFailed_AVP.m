//
//  UMDiameterAvpFailed_AVP.m
//  ulibdiameter
//
//  Created by afink on 2019-07-04 10:39:39.689000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"
#import "UMDiameterAvpFailed_AVP.h"
#import "UMDiameterAvpAVP.h"

@implementation UMDiameterAvpFailed_AVP


- (NSString *)avpType
{
    return @"Failed-AVP";
}

- (uint32_t)avpCode
{
    return 279;
}

+ (uint32_t)avpCode
{
    return 279;
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

