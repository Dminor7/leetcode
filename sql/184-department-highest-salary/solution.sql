# Write your MySQL query statement below

select
d.name as department
, e.name as employee
, e.salary as salary
from employee as e, department as d
where e.departmentid = d.id
and e.salary = (
    select max(e1.salary) 
    from employee e1 
    where e1.departmentid=d.id
)
;
# Alternate way

select
    department.name as department
    , employee.name as employee
    , salary
from
    employee
        join
    department on employee.departmentId = department.Id
where
    (employee.departmentId , salary) in
    (   select
            departmentId
            , max(salary)
        from
            employee
        group by departmentId
    )
;