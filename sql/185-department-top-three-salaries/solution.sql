# Write your MySQL query statement below
select
d.name as department
, dt.name as employee
, dt.salary as salary
from (
    select
    name
    , departmentid
    , salary
    , dense_rank() over(partition by departmentid order by salary desc) as salary_rank
    from employee
) as dt, department as d
where dt.departmentid = d.id
and dt.salary_rank <=3

# Alternate way
select
    d.name as department
    , e1.name as employee
    , e1.salary
from
    employee e1
        join
    department d on e1.departmentid = d.id
where
    3 > (select
            count(distinct e2.salary)
        from
            employee e2
        where
            e2.salary > e1.salary
                and e1.departmentid = e2.departmentid
        )