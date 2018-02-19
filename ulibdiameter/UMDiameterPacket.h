//
//  UMDiameterPacket.h
//  ulibdiameter
//
//  Created by Andreas Fink on 19.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

#define DIAMETER_COMMAND_FLAG_REQUEST
#define DIAMETER_COMMAND_FLAG_PROXIABLE
#define DIAMETER_COMMAND_FLAG_ERROR
#define DIAMETER_COMMAND_FLAG_POTENTIAL_RETRANSMIT

@interface UMDiameterPacket : UMObject
{
    uint8_t _version;
    uint32_t _messageLength;
    uint8_t     _commandFlags;
    uint32_t    _commandCode;
    uint32_t    _applicationId;
    uint32_t    _hopByHopIdentifier;
    uint32_t    _endToEndIdentifier;

    UMSynchronizedSortedDictionary *avps;
}

- (NSData *)packedData;


@end
