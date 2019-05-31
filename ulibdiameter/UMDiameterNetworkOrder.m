//
//  UMDiameterNetworkOrder.m
//  ulibdiameter
//
//  Created by Andreas Fink on 31.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterNetworkOrder.h"
#include <stdint.h>

#if defined(LINUX)
#include <endian.h>
#endif

#if defined(__APPLE__)
#include <sys/_endian.h>
#endif

void uint64_to_bytes(uint64_t v , uint8_t *bytes)
{
#if defined(__APPLE__)
    *(uint64_t *)bytes  = htonll( (uint64_t)v);
#else
#if defined(LINUX)
    *(uint64_t *)bytes  = htobe64( (uint64_t)v);
#else
    bytes[0] = (v >>  0)  & 0xFF;
    bytes[1] = (v >>  8)  & 0xFF;
    bytes[2] = (v >> 16) & 0xFF;
    bytes[3] = (v >> 24) & 0xFF;
    bytes[4] = (v >> 32) & 0xFF;
    bytes[5] = (v >> 40) & 0xFF;
    bytes[6] = (v >> 48) & 0xFF;
    bytes[7] = (v >> 52) & 0xFF;
#endif
#endif
}



uint64_t bytes_to_uint64(const uint8_t *bytes)
{
    uint64_t v;
    
#if defined(__APPLE__)
    v = ntohll(*(uint64_t *)&bytes[0]);
#else
#if defined(LINUX)
    v = be64toh(*(uint64_t *)&bytes[0]);
#else
    v = ((uint64_t)bytes[0] << 0)
    | ((uint64_t)bytes[1] << 8)
    | ((uint64_t)bytes[2] << 16)
    | ((uint64_t)bytes[3] << 24)
    | ((uint64_t)bytes[4] << 32)
    | ((uint64_t)bytes[5] << 40)
    | ((uint64_t)bytes[6] << 48)
    | ((uint64_t)bytes[7] << 52);
#endif
#endif
    return v;
}
