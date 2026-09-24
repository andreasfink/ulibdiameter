//
//  UMDiameterAvpLCS_Supported_GAD_Shapes.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvpUnsigned32.h>



@interface UMDiameterAvpLCS_Supported_GAD_Shapes : UMDiameterAvpUnsigned32
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

