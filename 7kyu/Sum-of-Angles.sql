-- Find the total sum of internal angles (in degrees)
-- in an n-sided simple polygon. N will be greater than 2.
-- select n as res from angle

-- formula (n-2) * 180

select (n-2) * 180 as res from angle;