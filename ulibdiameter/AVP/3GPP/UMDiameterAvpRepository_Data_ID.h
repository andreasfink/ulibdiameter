//
//  UMDiameterAvpRepository_Data_ID.h
//  ulibdiameter
//
//  Created by afink on 2019-10-16 21:17:01.105000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpService_Indication;
@class UMDiameterAvpSequence_Number;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpRepository_Data_ID : UMDiameterAvpGrouped
{
	UMDiameterAvpService_Indication	*_var_service_indication;
	UMDiameterAvpSequence_Number	*_var_sequence_number;
	NSArray<UMDiameterAvpAVP *>	*_var_avp;
}

@property(readwrite,strong,atomic)	UMDiameterAvpService_Indication	*var_service_indication;
@property(readwrite,strong,atomic)	UMDiameterAvpSequence_Number	*var_sequence_number;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*var_avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

