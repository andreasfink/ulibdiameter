//
//  UMDiameterAvpHostIpAddress.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpAddress.h"

@interface UMDiameterAvpHostIpAddress : UMDiameterAvpAddress

- (void)setHostIPAddress:(NSString *)theAddr;
- (void)setHostIPv4Address:(NSString *)theAddr;
- (void)setHostIPv6Address:(NSString *)theAddr;


@end
