-
- Given the the schema presented below
-- find two actors who cast together the most and list titles of only those movies they were casting together.
-- Order the result set alphabetically by the movie title.
--
--     Table film_actor
--             Column     | Type                        | Modifiers
--         ------------+-----------------------------+----------
--             actor_id    | smallint                    | not null
--             film_id     | smallint                    | not null
--             ...
--     Table actor
--             Column     | Type                        | Modifiers
--         ------------+-----------------------------+----------
--             actor_id    | integer                     | not null
--             first_name  | character varying(45)       | not null
--             last_name   | character varying(45)       | not null
--             ...
--     Table film
--             Column     | Type                        | Modifiers
--         ------------+-----------------------------+----------
--             film_id     | integer                     | not null
--             title       | character varying(255)      | not null
--             ...
--
--     The desired output:
--     first_actor | second_actor | title
-- ------------+--------------+--------------------
--     John Doe    | Jane Doe     | The Best Movie Ever
--     ...
--     first_actor - Full name (First name + Last name separated by a space)
--     second_actor - Full name (First name + Last name separated by a space)
--     title - Movie title
--     Note: actor_id of the first_actor should be lower then actor_id of the second_actor


WITH actor_pairs AS (
    SELECT
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM film_actor fa1
             JOIN film_actor fa2
                  ON fa1.film_id = fa2.film_id
                      AND fa1.actor_id < fa2.actor_id
),
     pair_counts AS (
         SELECT
             actor1_id,
             actor2_id,
             COUNT(*) AS films_together
         FROM actor_pairs
         GROUP BY actor1_id, actor2_id
     ),
     top_pair AS (
         SELECT actor1_id, actor2_id
         FROM pair_counts
         WHERE films_together = (
             SELECT MAX(films_together) FROM pair_counts
         )
     )
SELECT
    CONCAT(a1.first_name, ' ', a1.last_name) AS first_actor,
    CONCAT(a2.first_name, ' ', a2.last_name) AS second_actor,
    f.title
FROM top_pair tp
         JOIN actor_pairs ap
              ON tp.actor1_id = ap.actor1_id
                  AND tp.actor2_id = ap.actor2_id
         JOIN actor a1 ON a1.actor_id = tp.actor1_id
         JOIN actor a2 ON a2.actor_id = tp.actor2_id
         JOIN film f ON f.film_id = ap.film_id
ORDER BY f.title;