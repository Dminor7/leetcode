# Write your MySQL query statement below
select
p.FirstName
, p.LastName
, addr.City
, addr.State
from person p
left outer join
address addr
on p.PersonId = addr.PersonId