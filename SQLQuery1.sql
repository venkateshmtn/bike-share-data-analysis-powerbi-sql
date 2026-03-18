with cte as (
select * from [dbo].[bike_share_yr_0]
union all
select * from [dbo].[bike_share_yr_1]
) 
select 
dteday,
hr,
season,
a.yr,
weekday,
rider_type,
riders,
price,
COGS,
riders*price as revenue,
riders*price-COGS as profit
from cte a
left join cost_table b
on a.yr=b.yr
