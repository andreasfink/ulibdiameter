//
//  UMDiameterAvpDiameterIdentity+diameter.m
//  ulibdiameter
//
//  Created by Andreas Fink on 14.10.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvpDiameterIdentity+diameter.h>

@implementation UMDiameterAvpDiameterIdentity(diameter)


- (id)objectValue
{
    return [self stringValue];
}


@end
