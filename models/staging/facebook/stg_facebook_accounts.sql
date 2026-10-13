select
    cast(account_id as varchar) as account_id,
    cast(account_name as varchar) as account_name,
    cast(ad_currency_code as varchar) as currency_code,
    cast(account_created_at as timestamp) as account_created_at,
    cast(account_updated_at as timestamp) as account_updated_at
from {{ source('facebook_ads', 'accounts') }}