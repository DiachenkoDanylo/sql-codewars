-- For this challenge you need to create a simple SELECT statement.
-- Your task is to create a query and do a FULL TEXT SEARCH.
-- You must search the product table on the field name for the word Awesome
-- and return each row with the given word.
-- Your query MUST contain to_tsvector and to_tsquery PostgreSQL functions.

-- There is 2 way of usage tsvector and tsquery
-- 1) Inline where to_tsvector(name) @@ to_tsquery('Awesome');
-- 2) Production grade datasets
--     2.1) change schema alter table table add "tsvector_col" TSVECTOR;
--     2.2) insertion with to_tsvector(lang, text)
--          insert into table (tsvector_col) values (to_tsvector('english', 'lorem ipsum text'));
--     2.3) SEARCH select * from table where tsvector_col @@ to_tsquery('ipsum');
--     (@@ using for indexing text)
--
-- TO_TSVECTOR for transform text to tokens "simple" -> TSVECTOR
-- TO_TSQUERY for creating query for search -> TSQUERY
-- TSQUERY can use with logical operators & and | or ! not * prefix -> *sci  = science, scientific

select *
from product
where to_tsvector('english',name) @@ to_tsquery('Awesome');