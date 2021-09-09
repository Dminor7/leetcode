CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select 
        subq.salary 
      from (
          select
          salary,
          dense_rank() over(order by salary desc) as rn
          from employee
          
      ) as subq
      where subq.rn = N
      limit 1
  );
END