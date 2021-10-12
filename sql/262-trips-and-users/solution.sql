# Write your MySQL query statement below
with unbanned_trips as (
select 
*
from trips
where client_id not in (
    select
    users_id
    from users
    where role="client" and banned="Yes"
    ) and 
    driver_id not in (
        select
        users_id
        from users
        where role="driver" and banned="Yes"
    )
)



select 
dt.request_at as Day
, round(dt.cancelled_trips/dt.total_trips,2) as "Cancellation Rate"
from(
    select
    request_at
    , sum(case when status in ('cancelled_by_driver','cancelled_by_client') then 1 else 0 end) as cancelled_trips
    , count(id)  as total_trips
    from unbanned_trips
    where request_at between "2013-10-01" and "2013-10-03"
    group by request_at
) dt



# Alternate Solution
select 
request_at as Day
, round(sum(if(status = 'completed', 0, 1))/count(Status),2) as 'Cancellation Rate' 
from trips 
where client_Id not in (select users_id from users where banned = 'Yes') 
    and driver_Id not in (select users_Id from users where banned = 'Yes')
    AND request_at between '2013-10-01' AND '2013-10-03'
group by request_at