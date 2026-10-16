//
//  UMDiameterAvpGrouped.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvp.h>

@interface UMDiameterAvpGrouped: UMDiameterAvp
{
    UMSynchronizedArray *_grouped_avps;
}

- (NSArray *)array;
- (void)setArray:(NSArray *)array;
- (void)appendAvp:(UMDiameterAvp *)avp;
- (void)appendAvps:(NSArray <UMDiameterAvp *>*)avps;

@end
