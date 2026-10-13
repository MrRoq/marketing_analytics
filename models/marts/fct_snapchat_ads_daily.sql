with snapchat_ads_stats as (
    select *
    from {{ ref('stg_snapchat_ads_stats') }}
),

ad_details as (
    select *
    from {{ ref('int_snapchat_ads_details') }}
)

select
    'snapchat' as platform,

    stats.ad_id,
    details.ad_group_id,
    details.campaign_id,
    details.account_id,

    stats.reporting_date,
    stats.country_code,
    stats.currency_code,
    stats.spend,
    stats.impressions,
    stats.clicks

from snapchat_ads_stats as stats

left join ad_details as details
    on stats.ad_id = details.ad_id