with facebook_daily as (
    select
        platform,
        ad_id,
        ad_group_id,
        campaign_id,
        account_id,
        reporting_date,
        currency_code,
        spend,
        coalesce(impressions, 0) as impressions,
        coalesce(clicks, 0) as clicks
    from {{ ref('fct_facebook_ads_daily') }}
),

snapchat_daily as (
    select
        platform,
        ad_id,
        ad_group_id,
        campaign_id,
        account_id,
        reporting_date,
        currency_code,
        sum(spend) as spend,
        sum(coalesce(impressions, 0)) as impressions,
        sum(coalesce(clicks, 0)) as clicks
    from {{ ref('fct_snapchat_ads_daily') }}
    group by
        platform,
        ad_id,
        ad_group_id,
        campaign_id,
        account_id,
        reporting_date,
        currency_code
),

unified as (
    select
        platform,
        ad_id,
        ad_group_id,
        campaign_id,
        account_id,
        reporting_date,
        currency_code,
        spend,
        impressions,
        clicks
    from facebook_daily

    union all

    select
        platform,
        ad_id,
        ad_group_id,
        campaign_id,
        account_id,
        reporting_date,
        currency_code,
        spend,
        impressions,
        clicks
    from snapchat_daily
)

select *
from unified