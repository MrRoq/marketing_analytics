select
    ad_id,
    reporting_date,
    country_code,
    count(*) as row_count

from {{ ref('fct_snapchat_ads_daily') }}

group by
    ad_id,
    reporting_date,
    country_code
having count(*) > 1