with snapchat_ads as (
    select *
    from {{source('snapchat_ads', 'ads')}}

)

select 
    cast(ad_id as varchar) as ad_id,
    cast(ad_group_id as varchar) as ad_group_id,
    cast(ad_name as varchar) as ad_name,
    cast(ad_detail_updated_at as timestamp) as ad_detail_updated_at
from snapchat_ads