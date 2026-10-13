select
    cast(campaign_id as varchar) as campaign_id,
    cast(campaign_name as varchar) as campaign_name,
    cast(campaign_updated_at as timestamp) as campaign_updated_at
from {{ source('facebook_ads', 'campaigns') }}