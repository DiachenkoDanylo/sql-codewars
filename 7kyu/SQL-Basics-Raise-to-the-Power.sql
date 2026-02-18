-- Given the following table 'decimals':
--
-- decimals table schema
--          id
-- number1
-- number2
-- Return a table with a single column result which is the output of number1 raised to the power of number2.
select power(d.number1, d.number2) as "result" from decimals d;