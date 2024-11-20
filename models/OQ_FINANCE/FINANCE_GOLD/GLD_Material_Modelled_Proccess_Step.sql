select source_country, material_group, count(*) as NB_Products
from {{ ref("SLV_Material_Modelled_Proccess_Step") }}
group by source_country, material_group

