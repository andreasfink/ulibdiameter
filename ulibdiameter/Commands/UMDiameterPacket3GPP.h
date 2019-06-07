//
//  UMDiameterPacket3GPP.h
//  ulibdiameter
//
//  Created by Andreas Fink on 05.06.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterPacket.h"


@interface UMDiameterPacket3GPP : UMDiameterPacket
{
    NSString *_session_id;
    NSString *_orgin_host;
    NSString *_origin_realm;
    NSString *_destination_host;
    NSString *_destination_realm;
}

@property(readwrite,strong,atomic)      NSString *session_id;
@property(readwrite,strong,atomic)      NSString *origin_host;
@property(readwrite,strong,atomic)      NSString *origin_realm;
@property(readwrite,strong,atomic)      NSString *destination_host;
@property(readwrite,strong,atomic)      NSString *destination_realm;

@end
