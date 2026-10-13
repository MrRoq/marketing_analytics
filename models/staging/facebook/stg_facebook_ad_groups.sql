select
    cast(ad_group_id as varchar) as ad_group_id,
    ad_group_name,
    cast(ad_group_updated_at as timestamp) as ad_group_updated_at
from {{ source('facebook_ads', 'ad_groups') }}