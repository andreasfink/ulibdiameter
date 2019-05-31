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
    UMDiameterApplicationId_ETIS = 13019,
    UMDiameterApplicationId_FinkTelecomServices = 54013,
} UMDiameterVendorId;


/* see also https://www.iana.org/assignments/aaa-parameters/aaa-parameters.xml */

typedef enum UMDiameterApplicationId
{
    UMDiameterApplicationId_Diameter_Common_Messages = 0,
    UMDiameterApplicationId_Diameter_Base_Accounting = 3,
    UMDiameterApplicationId_3GPP_Cx      = 16777216,
    UMDiameterApplicationId_3GPP_Sh      = 16777217,
    UMDiameterApplicationId_3GPP_Re      = 16777218,
    UMDiameterApplicationId_3GPP_Wx      = 16777219,
    UMDiameterApplicationId_3GPP_Znx     = 16777220,
    UMDiameterApplicationId_3GPP_Zh      = 16777221,
    UMDiameterApplicationId_3GPP_Gq      = 16777222,
    UMDiameterApplicationId_3GPP_Gmb     = 16777223,
    UMDiameterApplicationId_3GPP_Gx      = 16777224,
    UMDiameterApplicationId_3GPP_Gx_over_Gy = 16777225,
    UMDiameterApplicationId_3GPP_MM10       = 16777226,
    UMDiameterApplicationId_Ericsson_MSI    = 16777227,
    UMDiameterApplicationId_Ericsson_Zx     = 16777228,
    UMDiameterApplicationId_3GPP_Rx         = 16777229,
    UMDiameterApplicationId_3GPP_Pr         = 16777230,

    UMDiameterApplicationId_3GPP_Sta        = 16777250,
    UMDiameterApplicationId_3GPP_S6a_S6d    = 16777251,
    UMDiameterApplicationId_3GPP_S13        = 16777252,
    UMDiameterApplicationId_3GPP_SWm        = 16777264,
    UMDiameterApplicationId_3GPP_SWx        = 16777265,
    UMDiameterApplicationId_3GPP_Gxx        = 16777266,
    UMDiameterApplicationId_3GPP_S9         = 16777267,
    UMDiameterApplicationId_3GPP_Zpn        = 16777268,
    UMDiameterApplicationId_3GPP_S6c =    16777312,  /* TS 29.338 */

/*
    16777302    3GPP Sy    [3GPP TS 29.219][Kimmo_Kymalainen]
    16777303    3GPP Sd    [3GPP TS 29.212][Kimmo_Kymalainen]

    16777308    3GPP S7a    [3GPP TS 29.272][Kimmo_Kymalainen]
    16777309    3GPP Tsp    [3GPP TS 29.368][Kimmo_Kymalainen]
    16777310    3GPP S6m    [3GPP TS 29.336][Kimmo_Kymalainen]
    16777311    3GPP T4    [3GPP TS 29.337][Kimmo_Kymalainen]
    16777312    3GPP S6c    [3GPP TS 29.338][Kimmo_Kymalainen]
    16777313    3GPP SGd    [3GPP TS 29.338][Kimmo_Kymalainen]
    16777318    3GPP S15    [3GPP TS 29.212][Kimmo_Kymalainen]
    16777319    3GPP S9a    [3GPP TS 29.215][Kimmo_Kymalainen]
    16777320    3GPP S9a*    [3GPP TS 29.215][Kimmo_Kymalainen]
    16777335    3GPP MB2-C    [3GPP TS 29.468][Kimmo_Kymalainen]
    16777336    3GPP PC4a    [3GPP TS 29.344][Kimmo_Kymalainen]
    16777337    3GPP PC2    [3GPP TS 29.343][Kimmo_Kymalainen]
    16777340    3GPP PC6/PC7    [3GPP TS 29.345][Kimmo_Kymalainen]
    16777342    3GPP Np    [3GPP TS 29.217][Kimmo_Kymalainen]
...
 */
} UMDiameterApplicationId;

