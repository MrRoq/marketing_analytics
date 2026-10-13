/*
Checks that the daily performance mart has at most one row
per ad per reporting date. Fails if the joins duplicate rows.
*/

select
    ad_id,
    reporting_date,
    count(*) as row_count
from {{ ref('fct_facebook_ads_daily') }}
group by
    ad_id,
    reporting_date
having count(*) > 1