//
//  UMDiameterApplicationId.h
//  ulibdiameter
//
//  Created by Andreas Fink on 27.05.19.
//  Copyright © 2019 Andreas Fink. All rights reserved.
//

typedef enum UMDiameterVendorId
{
    UMDiameterApplicationId_3GPPP2 = 5535,
    UMDiameterApplicationId_3GPP = 10415,
    UMDiameterApplicationId_Amdocs = 11580,
    UMDiameterApplicationId_ETIS = 13019,
    UMDiameterApplicationId_Camiant_Inc = 21274,
    UMDiameterApplicationId_Traffix_Systems_Ltd = 27611,
    UMDiameterApplicationId_BroadForward_BV = 39216,
    UMDiameterApplicationId_FinkTelecomServices = 999999,
} UMDiameterVendorId;

typedef enum UMDiameterApplicationId
{
    UMDiameterApplicationId_Diameter_Common_Messages = 0,
    UMDiameterApplicationId_Diameter_Base_Accounting = 3,
    UMDiameterApplicationId_3GPP_S6a_S6d = 16777251,
    UMDiameterApplicationId_3GPP_S9      = 16777267,
} UMDiameterApplicationId;

