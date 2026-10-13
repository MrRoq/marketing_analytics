-- Return daily records containing negative advertising metrics.
select
    platform,
    ad_id,
    reporting_date,
    spend,
    impressions,
    clicks
from {{ ref('fct_paid_ads_daily') }}
where spend < 0
   or impressions < 0
   or clicks < 0