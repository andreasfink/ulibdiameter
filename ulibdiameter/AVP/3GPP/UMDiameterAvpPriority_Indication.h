//
//  UMDiameterAvpPriority_Indication.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:31:27.211657
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/AVP/UMDiameterAvpEnumerated.h>



@interface UMDiameterAvpPriority_Indication : UMDiameterAvpEnumerated
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

