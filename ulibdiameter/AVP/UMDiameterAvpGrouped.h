//
//  UMDiameterAvpGrouped.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/ulibdiameter.h>

@interface UMDiameterAvpGrouped: UMDiameterAvp
{
    UMSynchronizedArray *_avps;
}

@end
