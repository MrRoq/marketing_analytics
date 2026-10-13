select
    cast(ad_id as varchar) as ad_id,
    cast(account_id as varchar) as account_id,
    cast(campaign_id as varchar) as campaign_id,
    cast(ad_group_id as varchar) as ad_group_id,
    ad_name,
    cast(ad_status as varchar) as ad_status,
    cast(ad_updated_at as timestamp) as ad_updated_at
from {{ source('facebook_ads', 'ads') }}