//
//  UMDiameterMessage.h
//  ulibdiameter
//
//  Created by Andreas Fink on 12.02.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@class UMDiameterPeer;
@class UMDiameterPacket;
@class UMDiameterRouter;

@interface UMDiameterMessage : UMObject
{
    UMDiameterPeer      *_source;
    UMDiameterPeer      *_destination;
    UMDiameterPacket    *_packet;
    UMDiameterRouter    *_router;
}


@property(readwrite,strong,atomic)  UMDiameterPeer      *source;
@property(readwrite,strong,atomic)  UMDiameterPeer      *destination;
@property(readwrite,strong,atomic)  UMDiameterPacket    *packet;
@property(readwrite,strong,atomic)  UMDiameterRouter    *router;

@end

