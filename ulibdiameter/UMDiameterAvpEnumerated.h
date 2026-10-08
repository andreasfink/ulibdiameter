//
//  UMDiameterAvpEnumerated.h
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#import <ulibdiameter/UMDiameterAvpInteger32.h>

@interface UMDiameterAvpEnumerated : UMDiameterAvpInteger32

- (UMDiameterAvpEnumerated *)initWithEnumDef:(NSDictionary *)dict value:(NSString *)val;
@end
