-- For this challenge you need to create a simple SELECT statement that will return all columns from the products table, and join to the companies table so that you can return the company name.
--
--      products table schema
-- id
-- name
-- isbn
-- company_id
-- price
--      companies table schema
-- id
-- name
-- You should return all product fields as well as the company name as "company_name".

select p.id, p.name, p.isbn, p.company_id, c.name as company_name, p.price from products p
        join companies c on p.company_id = c.id;

select p.*, c.name as company_name
        from products p join companies c on p.company_id = c.id;