//
//  UMDiameterService.h
//  ulibdiameter
//
//  Created by Andreas Fink on 21.02.18.
//  Copyright © 2018 Andreas Fink. All rights reserved.
//

#import <ulib/ulib.h>

@interface UMDiameterService : UMObject
{
    BOOL    _stateless;
}
@property(readwrite,assign,atomic)      BOOL    stateless;

- (void)sendRAR;
- (void)cleanup;
- (void)updateSession;
- (void)sendASR;
- (void)sendSTA;


@end


