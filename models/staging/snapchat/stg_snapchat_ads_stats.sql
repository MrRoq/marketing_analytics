select
    cast(ad_detail_id as varchar) as ad_id,
    cast(ad_date as date) as reporting_date,
    cast(ad_currency_code as varchar) as currency_code,
    cast(ad_country as varchar) as country_code,

    cast(ad_spend as number(18, 6)) as spend,

    cast(
        nullif(lower(trim(ad_impressions)), 'null')
        as integer
    ) as impressions,

    cast(
        nullif(lower(trim(ad_clicks)), 'null')
        as integer
    ) as clicks,

    cast(data_src as varchar) as data_src

from {{ source('snapchat_ads', 'ads_stats') }}