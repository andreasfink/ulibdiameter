//
//  UMDiameterAvpErrorReportingHost.m
//  ulibdiameter
//
//  Created by Andreas Fink on 20.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpErrorReportingHost.h"

@implementation UMDiameterAvpErrorReportingHost



- (NSString *)avpType
{
    return @"ErrorReportingHost";
}

- (uint32_t)avpCode
{
    return UMDiameterAvpCode_ErrorReportingHost;
}


@end
