select 

COMPONENT
, PRODUCT_CATEGORY
, count(*) as NB_Products
from {{ ref("SLV_Material_Modelled_Proccess_Step") }}
group by  COMPONENT,PRODUCT_CATEGORY

