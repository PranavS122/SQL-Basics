
# MySQL ALTER TABLE – Add columns to a table ---------------------------------

/*
To add a column to a table, you use the ALTER TABLE ADD syntax:

# ADD
ALTER TABLE table_name
    ADD new_column_name column_definition
    [FIRST | AFTER column_name],
    
    ADD new_column_name column_definition
    [FIRST | AFTER column_name],
    ...;
    
# MODIFIY 
ALTER TABLE table_name
    MODIFY column_name column_definition
    [ FIRST | AFTER column_name],
    MODIFY column_name column_definition
    [ FIRST | AFTER column_name],
    ...;
    

*/
select * from empl;
describe empl;

# 1. Add two columns in above table
ALTER TABLE empl
ADD city VARCHAR(50),
ADD email2 VARCHAR(255);

select * from empl;

# 2. modify table column
describe empl;

ALTER TABLE empl 
MODIFY email VARCHAR(100) NOT NULL;

describe empl;

# 3. rename column
ALTER TABLE empl 
CHANGE COLUMN city addr VARCHAR(100);

# 4. Drop both new columns 
ALTER TABLE empl
DROP COLUMN email;

select * from empl;

# 5. rename table empl to test
ALTER TABLE empl 
RENAME TO test;

select * from test;

# 6. Drop table test
DROP TABLE test;
DROP TABLE IF EXISTS test;


# MySQL UPDATE statement

/*
The following illustrates the basic syntax of the UPDATE statement:

UPDATE [LOW_PRIORITY] [IGNORE] table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];

*/

# 1. update the email of any emplyees to the new email 
select * from employees;

SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
 
select * from devdb.mytable ; 
-----------------------

UPDATE employees 
SET 
    email = 'test@gmail.com'
WHERE
    employeeNumber = 1056;
    
# 2. update the lastname and first name 

UPDATE employees 
SET 
    lastname = 'new laafasdstname',
    firstname = 'firstasdf name'
WHERE
    employeeNumber = 1056;
    
# 4. add 100$ to all product price in products table

select * from products;

UPDATE products 
SET 
    buyPrice = buyPrice + 100;
    

# MySQL DELETE and LIMIT clause ----------------------

# You are using a safe mode and you tried to update a table without a WHERE that uses a Key column.

# 1. delete all records from the task table
select * from empl;
delete from empl;
drop table task;

# 2. delete all records where country is france
select * from customers;
DELETE FROM customers
WHERE country = 'France';

# 3. delete top 5 records where country is USA
DELETE FROM customers
WHERE country = 'USA' 
ORDER BY creditLimit
LIMIT 5;


#  MySQL GROUP BY clause ----------------------

 /*
 SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;
 */

# 1. select status group value from orders 
select * from orders;

SELECT 
    status
FROM
    orders
GROUP BY status;

# or 

SELECT DISTINCT
    status
FROM
    orders;

# 2. count number of orders in each status
select count(*) from orders;

SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY status;

# 3. returns the order numbers and the total amount of each order.
select * from orderdetails;
select * from orders;


SELECT 
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY 
    orderNumber;
    


# 4. extract year from order date, count order per year

SELECT 
    YEAR(orderDate) AS year, 
    COUNT(orderNumber)
FROM
    orders
GROUP BY 
    year;

# HAVING Clause ----------------------
/*
The  HAVING clause is used in the SELECT statement to specify 
filter conditions for a group of rows or aggregates.
The following illustrates the syntax of the HAVING clause:

SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;

*/

# 1. get order numbers, the number of items sold per order, 
# and total sales for each from the orderdetails table:

select * from orderdetails;
select * from orders;


SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

# 2.  find which order has total sales greater than 1000

SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY 
   ordernumber
HAVING 
   total > 1000;

# 3.  find orders that have total amounts greater than 1000 
# and contain more than 600 items

SELECT 
    `ordernumber`,
    SUM(`quantityOrdered`) AS `items Count`,
    SUM(`priceeach`*`quantityOrdered`) AS `total`
FROM
    `orderdetails`
GROUP BY `ordernumber`
HAVING
    `total` > 1000 AND
    `items Count` > 600;



# MySQL alias for tables and columns  ----------------------


/*
he following statement illustrates how to use the column alias:

SELECT 
   [column_1 | expression] AS descriptive_name
FROM table_name;

or 

SELECT 
   [column_1 | expression] AS `descriptive name`
FROM 
   table_name;
*/


# 1. join first name and last name

SELECT 
    CONCAT_WS('_', lastName, firstname)
FROM
    employees;

# or 

SELECT
	CONCAT_WS(', ', lastName, firstname) `Full name`
FROM
	employees
    
ORDER BY
	`Full name`;


# 2. selects the orders whose total amount are greater than 60000.

SELECT
	orderNumber `Order no.`,
	SUM(priceEach * quantityOrdered) total
FROM
	orderDetails
GROUP BY
	`Order no.`
HAVING
	total > 60000;
    
# 3. use alias name for table

SELECT 
    e.firstName, 
    e.lastName
FROM
    employees e
ORDER BY e.firstName;