/*
Checks if spend, impressions, or clicks are negative.

The test fails when any of these metrics is below zero.
Missing values remain NULL and are not treated as zero.
*/

select
    ad_id,
    reporting_date,
    spend,
    impressions,
    clicks
from {{ ref('stg_facebook_ads_stats') }}
where spend < 0
   or impressions < 0
   or clicks < 0