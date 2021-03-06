//
//  UMDiameterAvpService_Report.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpService_Result;
@class UMDiameterAvpNode_Type;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpService_Report : UMDiameterAvpGrouped
{
	UMDiameterAvpService_Result	*_var_service_result;
	UMDiameterAvpNode_Type	*_var_node_type;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpService_Result	*var_service_result;
@property(readwrite,strong,atomic)	UMDiameterAvpNode_Type	*var_node_type;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

