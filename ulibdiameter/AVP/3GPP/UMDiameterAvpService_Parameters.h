//
//  UMDiameterAvpService_Parameters.h
//  ulibdiameter
//
//  Created by afink on 2021-03-26 21:24:05.223965
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpT4_Parameters;
@class UMDiameterAvpApplication_Port_Identifier;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpService_Parameters : UMDiameterAvpGrouped
{
	UMDiameterAvpT4_Parameters	*_var_t4_parameters;
	UMDiameterAvpApplication_Port_Identifier	*_var_application_port_identifier;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpT4_Parameters	*var_t4_parameters;
@property(readwrite,strong,atomic)	UMDiameterAvpApplication_Port_Identifier	*var_application_port_identifier;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

