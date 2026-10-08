//
//  UMDiameterNetworkOrder.h
//  ulibdiameter
//
//  Created by Andreas Fink on 31.05.19.
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#include <stdint.h>

void     uint64_to_bytes(uint64_t v , uint8_t *bytes);
uint64_t bytes_to_uint64(const uint8_t *bytes);
