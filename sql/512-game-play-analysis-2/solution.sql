# Write your MySQL query statement below
select player_id, device_id 
from activity 
where (
    player_id
    , event_date
) in (
        select 
        player_id
        , min(event_date)
        from activity 
        group by player_id
) 

# alternate solution
select 
distinct player_id
, first_value(device_id) over (partition by player_id order by event_date) as device_id
from activity