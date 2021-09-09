# Write your MySQL query statement below
select
score
, dense_rank() over(order by score desc) 'Rank'
from scores;

# Without dense rank
select 
s1.score
, count(s2.score) 'Rank' 
from scores s1,
(select distinct score from scores) s2
where s1.score<=s2.score
group by  s1.id 
order by s1.score desc;