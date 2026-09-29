//
//  UMDiameterAvpMaximum_UE_Availabilit.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:13:02.328768
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpTime.h>
<<<<<<< HEAD:ulibdiameter/AVP/3GPP/UMDiameterAvpMaximum_UE_Availabilit.h

=======
>>>>>>> master:ulibdiameter/UMDiameterAvpMaximum_UE_Availabilit.h


@interface UMDiameterAvpMaximum_UE_Availabilit : UMDiameterAvpTime
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

