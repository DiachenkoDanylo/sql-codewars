-- You are given a table box with the following columns: width (int), height (int), depth (int).
-- Those values will be greater than 0.
--
-- Write an SQL query that returns these columns:
--
-- width
-- height
-- depth
-- area (int) - the total surface area of the box.
-- volume (int) - the volume of the box. Sort the results by area ascending,
-- then by volume ascending, then by width ascending, and finally by height in ascending order.

-- # write your SQL statement here:
-- you are given a table 'box' with columns: width (int), height (int), depth (int)
-- return a query with columns: width, height, depth, area (int), volume (int)
-- sort results by area ascending, then volume ascending, then width ascending, then height ascending

-- area = (a*b + c*b + a*c) * 2
-- volume = a * b * c

select b.width, b.height, b.depth, ((b.width * b.height) + (b.depth * b.height) + (b.width * b.depth)) * 2  as  area, (b.width * b.height * b.depth) as  volume
from box b order by area asc, volume asc, b.width asc, b.height asc;