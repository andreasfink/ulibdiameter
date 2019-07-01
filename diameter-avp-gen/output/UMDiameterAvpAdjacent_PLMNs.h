//
//  UMDiameterAvpAdjacent_PLMNs.h
//  ulibdiameter
//
//  Created by afink on 2019-07-01 13:11:54.726000
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

#import "UMDiameterAvpGrouped.h"

@class UMDiameterAvpVisited_PLMN_Id;
@class UMDiameterAvpAVP;


@interface UMDiameterAvpAdjacent_PLMNs : UMDiameterAvpGrouped
{
	NSArray<UMDiameterAvpVisited_PLMN_Id *>	*_visited_plmn_id;
	NSArray<UMDiameterAvpAVP *>	*_avp;
}

@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpVisited_PLMN_Id *>	*visited_plmn_id;
@property(readwrite,strong,atomic)	NSArray<UMDiameterAvpAVP *>	*avp;

- (NSString *)avpType;
- (uint32_t)avpCode;
+ (uint32_t)avpCode;

@end

