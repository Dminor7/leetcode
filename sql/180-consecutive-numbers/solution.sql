# Write your MySQL query statement below
select 
distinct dt.num as ConsecutiveNums
from(
    select
    num, count(*) consecutive_apperance
    from(
        select
        num
        , id - cast(row_number() over(order by num) as signed) as grp
        from logs
    ) as g
    group by g.grp, g.num
) as dt
where 
dt.consecutive_apperance >= 3