//
//  UMDiameterAvpEnumerated.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpInteger32.h>

@interface UMDiameterAvpEnumerated : UMDiameterAvpInteger32

- (UMDiameterAvpEnumerated *)initWithEnumDef:(NSDictionary *)dict value:(NSString *)val;
@end
