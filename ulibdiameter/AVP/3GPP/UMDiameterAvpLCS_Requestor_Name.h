//
//  UMDiameterAvpLCS_Requestor_Name.h
//  ulibdiameter
//
//  Created by afink on 2020-05-01 08:45:30.605285
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpLCS_Requestor_Id_String;
@class UMDiameterAvpLCS_Format_Indicator;


@interface UMDiameterAvpLCS_Requestor_Name : UMDiameterAvpGrouped
{
	UMDiameterAvpLCS_Requestor_Id_String	*_var_lcs_requestor_id_string;
	UMDiameterAvpLCS_Format_Indicator	*_var_lcs_format_indicator;
}

@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Requestor_Id_String	*var_lcs_requestor_id_string;
@property(readwrite,strong,atomic)	UMDiameterAvpLCS_Format_Indicator	*var_lcs_format_indicator;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;
+ (id)definition;

@end

