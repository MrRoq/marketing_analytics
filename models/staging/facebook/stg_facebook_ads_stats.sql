select
    cast(ad_id as varchar) as ad_id,
    cast(account_id as varchar) as account_id,
    cast(ad_date as date) as reporting_date,
    cast(ad_spend as number(38, 2)) as spend,
    cast(
    nullif(lower(trim(ad_impressions)), 'null')
    as number(38, 0)
    ) as impressions,
    cast(
    nullif(lower(trim(ad_clicks)), 'null')
    as number(38, 0)
    ) as clicks
from {{ source('facebook_ads', 'ads_stats') }}