select
    cast(_surrogate_key as varchar) as source_surrogate_key,
    cast(ad_group_id as varchar) as ad_group_id,
    cast(campaign_id as varchar) as campaign_id,
    cast(ad_group_name as varchar) as ad_group_name,
    cast(ad_group_updated_at as timestamp_tz) as ad_group_updated_at
from {{ source('snapchat_ads', 'ad_groups') }}