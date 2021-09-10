# Write your MySQL query statement below

delete from person
where id in (
    select
    dt.id
    from(
        select
        id
        , row_number() over(partition by email order by id) as row_id
        from person
    ) as dt
    where dt.row_id<>1
)
;

# Alternate way
delete from person where id not in
(select * from(
    select min(Id) from person group by email) as p);