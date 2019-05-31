//
//  UMDiameterAvpGrouped.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvp.h"

@interface UMDiameterAvpGrouped: UMDiameterAvp
{
    UMSynchronizedArray *_avps;
}

- (NSArray *)array;
- (void)setArray:(NSArray *)array;

@end
