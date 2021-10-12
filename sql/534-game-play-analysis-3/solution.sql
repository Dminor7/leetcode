# Write your MySQL query statement below
select
player_id
, event_date
, sum(games_played) over(partition by player_id order by event_date ) as games_played_so_far
from activity


# alternate solution
select 
a1.player_id
, a1.event_date
, sum(a2.games_played) as games_played_so_far
from activity as a1
inner join activity as a2
on a1.event_date >= a2.event_date
and a1.player_id = a2.player_id
group by  a1.player_id, a1.event_date