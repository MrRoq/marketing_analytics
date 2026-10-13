
with facebook_ads_stats as (
    select *
    from {{ref('stg_facebook_ads_stats')}}
),
details as (
    select *
    from {{ref('int_facebook_ads_details')}}

),
fact_facebook_details as (

select 
    details.platform,
    fads.ad_id,
    fads.account_id,
    details.campaign_id,
    details.ad_group_id,

    fads.reporting_date,
    fads.spend,
    fads.impressions,
    fads.clicks,

    
    details.currency_code

from facebook_ads_stats as fads
left join details as details
    using (ad_id)
)


select *
from fact_facebook_details