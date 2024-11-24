
with FCT_MATERIALS as (
select
    NB_LINE 	,
    PRODUCT_CATEGORY 	,
    COMPONENT 	,
    MATERIAL_GROUP 	,
    RAW_MATERIAL 	,
    SUPPLIER_CODE 	,
    MATERIAL_CODE 	,
    REPLACE (
            trim(
                    UPPER(SOURCE_COUNTRY)
                    ),'Itally','Italy'
                    ) AS SOURCE_COUNTRY, 	
    TRACEABILITY 	,
    ALIGNMENT_KERING_ST 	,
    PURCHASE_COUNTRY 	,
    RAW_HIDE_WET_BLUE_STAGE 	,
    WET_HIDE_WET_BLUE_STAGE 	,
    A_2023_INPUT_QUALITY 	,
    A_2023_INPUT_UNIT 	,
    CONVERSION_FACTOR 	,
    A_2023_QUANTITY_CONS_UNIT	,
    CONSOLIDATION_UNIT 	,
    SUPPLIER 	,
    CERTIFICATION 	,
    ADDITIONAL_QUESTION 	,
    ANSWER 	,
    TRADEMARK	,
    MODELLED_MATERIAL	,
    TIER	,
    PROCESS_STEP	

from {{ref("BRZ_RAW_MATERIAL_MODELLED_PROCESS_STEPS") }}
),

LU_COUNTRY AS (
    select
NB_LINE	,
MODELLED_MATERIAL	,
PROCESS_STEP	,
trim(UPPER(SOURCE_COUNTRY))	as SOURCE_COUNTRY,
ENVIRONEMENT_INDICATOR	,
LCA_1K_MOD_MAT		
from {{ref("BRZ_Source_Country") }} 
) 


select
M.NB_LINE 	,
M.PRODUCT_CATEGORY 	,
M.COMPONENT 	,
M.MATERIAL_GROUP 	,
M.RAW_MATERIAL 	,
M.SUPPLIER_CODE 	,
M.MATERIAL_CODE 	,
M.SOURCE_COUNTRY, 	
M.TRACEABILITY 	,
M.ALIGNMENT_KERING_ST 	,
M.PURCHASE_COUNTRY 	,
M.RAW_HIDE_WET_BLUE_STAGE 	,
M.WET_HIDE_WET_BLUE_STAGE 	,
M.A_2023_INPUT_QUALITY 	,
M.A_2023_INPUT_UNIT 	,
M.CONVERSION_FACTOR 	,
M.A_2023_QUANTITY_CONS_UNIT	,
M.CONSOLIDATION_UNIT 	,
M.SUPPLIER 	,
M.CERTIFICATION 	,
M.ADDITIONAL_QUESTION 	,
M.ANSWER 	,
M.TRADEMARK	,
M.MODELLED_MATERIAL	,
M.TIER	,
M.PROCESS_STEP
,C.LCA_1K_MOD_MAT
,C.ENVIRONEMENT_INDICATOR
FROM FCT_MATERIALS M
 JOIN LU_COUNTRY C
    ON M.MODELLED_MATERIAL=C.MODELLED_MATERIAL
    AND M.PROCESS_STEP=C.PROCESS_STEP
    AND M.SOURCE_COUNTRY=C.SOURCE_COUNTRY

