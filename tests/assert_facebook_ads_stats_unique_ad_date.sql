select
    ad_id,
    reporting_date,
    count(*) as row_count
from {{ ref('stg_facebook_ads_stats') }}
group by
    ad_id,
    reporting_date
having count(*) > 1