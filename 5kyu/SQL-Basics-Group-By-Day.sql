-- There is an events table used to track different key activities taken on a website. For this task you need to:
--
-- find the entries whose name equals "trained"
-- group them by the day the activity happened (the date part of the created_at timestamp) and their descriptions
-- the 2 aforementioned fields should be returned together with the number of grouped entries in a column called count
-- the result should also be sorted by day
--
--     "events" table schema
--         id (bigint)
--         name (text)
--         created_at (timestamp)
--         description (text)
--
--     expected result schema
--         day (date)
--         description (text)
--         count (numeric)


-- casting timestamp for day '2010-02-12 12:00:00'::timestamp::date -> 2010-02-12
SELECT e.created_at::timestamp::date as "day", e.description, count(*) as "count"
    from events e where e.name = 'trained'
        group by "day", e.description;