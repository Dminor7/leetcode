# Write your MySQL query statement below

# correlated subquery
select
w1.id
from weather as w1
where w1.temperature > (
    select 
    w2.temperature  
    from weather as w2
    where w2.recorddate = date_sub(w1.recorddate, interval 1 day)
)


# Alternate way
select w1.id 
from weather AS w1, weather AS w2
where datediff(w1.recorddate, w2.recorddate)=1 
and w1.temperature > w2.temperature