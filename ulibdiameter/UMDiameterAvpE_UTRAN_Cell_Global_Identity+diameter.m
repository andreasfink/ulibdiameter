//
//  UMDiameterAvpE_UTRAN_Cell_Global_Identity.m
//  ulibdiameter
//
//  Created by afink on 2020-12-28 14:28:35.115196
//  Copyright (c) 2026 Andreas Fink. All rights reserved.
//

#import <ulibgsmmap/ulibgsmmap.h>
#import <ulibdiameter/UMDiameterAvpE_UTRAN_Cell_Global_Identity+diameter.h>

@implementation UMDiameterAvpE_UTRAN_Cell_Global_Identity(diameter)

- (id)objectValue
{
    return [UMGSMMAP_E_UTRAN_CGI decodeECGI:[self dataValue]];
}

@end

