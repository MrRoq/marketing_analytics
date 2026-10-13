/*
Checks if an ad in ads_stats references the same account
as that ad in the ads table.

This checks consistency because we are comparing the account
assigned to the ad across two models. It does not check whether
the ad or an ad/date combination appears more than once.

The test fails when the account IDs do not match.
*/

select
    stats.ad_id,
    stats.reporting_date,
    stats.account_id as stats_account_id,
    ads.account_id as ads_account_id
from {{ ref('stg_facebook_ads_stats') }} as stats
inner join {{ ref('stg_facebook_ads') }} as ads
    on stats.ad_id = ads.ad_id
where stats.account_id <> ads.account_id