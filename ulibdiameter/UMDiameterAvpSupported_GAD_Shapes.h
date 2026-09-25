//
//  UMDiameterAvpSupported_GAD_Shapes.h
//  ulibdiameter
//
//  Created by afink on 2019-09-24 14:46:18.366000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpUnsigned32.h>



@interface UMDiameterAvpSupported_GAD_Shapes : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

