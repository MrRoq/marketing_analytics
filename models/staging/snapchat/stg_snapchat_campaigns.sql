select
    cast(campaign_id as varchar) as campaign_id,
    cast(account_id as varchar) as account_id,
    cast(campaign_name as varchar) as campaign_name
from {{ source('snapchat_ads', 'campaigns') }}