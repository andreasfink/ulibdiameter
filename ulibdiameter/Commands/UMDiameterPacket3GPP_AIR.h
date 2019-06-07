//
//  UMDiameterPacket3GPP_AIR.h
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket3GPP.h"


@interface UMDiameterPacket3GPP_AIR : UMDiameterPacket3GPP
{
    NSString *_imsi;
    NSString *_supported_features;
    NSString *_requested_eutran_authentication_info;
    NSString *_requested_utran_geran_authentication_info;
    NSString *_visited_plmn_id;
    NSString *_air_flags;
}

@property(readwrite,strong,atomic)  NSString *imsi;
@property(readwrite,strong,atomic)  NSString *supported_features;
@property(readwrite,strong,atomic)  NSString *requested_eutran_authentication_info;
@property(readwrite,strong,atomic)  NSString *requested_utran_geran_authentication_info;
@property(readwrite,strong,atomic)  NSString *visited_plmn_id;
@property(readwrite,strong,atomic)  NSString *air_flags;

@end

