//
//  UMDiameterAvpHost_IP_Address.h
//  ulibdiameter
//
//  Created by afink on 2020-12-24 14:13:32.336902
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvpAddress.h>



@interface UMDiameterAvpHost_IP_Address : UMDiameterAvpAddress
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

