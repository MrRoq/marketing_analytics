with latest_ads as (
    select *
    from {{ ref('stg_facebook_ads') }}
    qualify row_number() over (
        partition by ad_id
        order by ad_updated_at desc
    ) = 1
),

latest_ad_groups as (
    select *
    from {{ ref('stg_facebook_ad_groups') }}
    qualify row_number() over (
        partition by ad_group_id
        order by ad_group_updated_at desc
    ) = 1
),

latest_campaigns as (
    select *
    from {{ ref('stg_facebook_campaigns') }}
    qualify row_number() over (
        partition by campaign_id
        order by campaign_updated_at desc
    ) = 1
),

latest_accounts as (
    select *
    from {{ ref('stg_facebook_accounts') }}
    qualify row_number() over (
        partition by account_id
        order by account_updated_at desc
    ) = 1
)

select
    ads.ad_id,
    ads.account_id,
    ads.campaign_id,
    ads.ad_group_id,
    ads.ad_name,
    ads.ad_status,
    ads.ad_updated_at,

    greatest(
        ads.ad_updated_at,
        ad_groups.ad_group_updated_at,
        campaigns.campaign_updated_at,
        accounts.account_updated_at
    ) as ad_detail_updated_at,

    ad_groups.ad_group_name,
    campaigns.campaign_name,
    accounts.account_name,
    accounts.currency_code,
    'facebook' as platform

from latest_ads as ads

left join latest_ad_groups as ad_groups
    on ads.ad_group_id = ad_groups.ad_group_id

left join latest_campaigns as campaigns
    on ads.campaign_id = campaigns.campaign_id

left join latest_accounts as accounts
    on ads.account_id = accounts.account_id