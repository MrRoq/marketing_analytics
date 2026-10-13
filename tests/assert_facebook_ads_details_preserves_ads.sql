/*
Checks that every ad in the staging ads model is still
present after joining its descriptive details.

The test fails when an ad is missing from the joined model.
*/

select
    ads.ad_id
from {{ ref('stg_facebook_ads') }} as ads
left join {{ ref('int_facebook_ads_details') }} as details
    on ads.ad_id = details.ad_id
where details.ad_id is null