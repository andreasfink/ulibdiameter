//
//  UMDiameterAvp3GPP_Supported_Features.h
//  ulibdiameter
//
//  Created by Andreas Fink on 11.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"


@interface UMDiameterAvp3GPP_Supported_Features : UMDiameterAvpGrouped
{
    uint32_t    _vendor_id;
    uint32_t    _feature_list_id;
    uint32_t    _feature_list;
    NSArray *_additional_avps;
}

@property(readwrite,atomic,assign) uint32_t   vendor_id;
@property(readwrite,atomic,assign) uint32_t   feature_list_id;
@property(readwrite,atomic,assign) uint32_t   feature_list;
@property(readwrite,atomic,strong) NSArray    *additional_avps;

- (NSString *)stringValue;
- (void)setStringValue:(NSString *)str;
@end


