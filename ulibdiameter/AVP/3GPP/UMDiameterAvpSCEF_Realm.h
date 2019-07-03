//
//  UMDiameterAvpSCEF_Realm.h
//  ulibdiameter
//
//  Created by afink on 2019-07-03 15:00:31.981000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpDiameterIdentity.h"



@interface UMDiameterAvpSCEF_Realm : UMDiameterAvpDiameterIdentity
{
}


- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

