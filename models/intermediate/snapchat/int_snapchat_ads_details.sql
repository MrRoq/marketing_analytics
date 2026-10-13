with latest_ad_groups as (
    select
        ad_group_id,
        campaign_id,
        ad_group_name,
        ad_group_updated_at
    from {{ ref('stg_snapchat_ad_groups') }}
    qualify row_number() over (
        partition by ad_group_id
        order by ad_group_updated_at desc
    ) = 1
)

select
    ads.ad_id,
    ads.ad_group_id,
    ad_groups.campaign_id,
    campaigns.account_id,

    ads.ad_name,
    ad_groups.ad_group_name,
    campaigns.campaign_name,

    ads.ad_detail_updated_at,
    ad_groups.ad_group_updated_at,

    'snapchat' as platform

from {{ ref('stg_snapchat_ads') }} as ads

left join latest_ad_groups as ad_groups
    on ads.ad_group_id = ad_groups.ad_group_id

left join {{ ref('stg_snapchat_campaigns') }} as campaigns
    on ad_groups.campaign_id = campaigns.campaign_id