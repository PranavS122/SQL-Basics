
# to check all the database
show databases;


# select database;
use classicmodels;
use fkdemo;


# SELECT STATEMENTS -----------------------------------

/*
Follow this sysntax for select statements

SELECT select_list
FROM table_name;
*/


# 1. select all columns from the table
SELECT * FROM orders;
SELECT * FROM classicmodels.orders;

# 3. select single columns from the table
SELECT 
    firstname
FROM
    employees;
    
# 2. select multiple columns 

SELECT 
    lastname, firstname, jobtitle
FROM
    employees;
    
    
    

# Sorting data --------------------------------------

/*
The following illustrates the syntax of the ORDER BY  clause:

SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;
*/

# 1. sort the customers by the values in the contactLastName 
# column in ascending order.

SELECT 
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname asc;

# 2. sort customers by lastname in descending order 
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;

select * from customes;

SELECT 
    contactlastname, contactfirstname
FROM
    customers
ORDER BY contactlastname desc;

# 3. sort customers by last name in descending order and then 
# first name by ascending order
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC,
	contactFirstname ASC;
    
    
# 4. selects the order line items from the orderdetails table. 
# calculates the subtotal for each line item and sorts the result set 
# based on the subtotal.
select * from orderdetails;



SELECT 
    orderNumber,
    productCode,
    orderlinenumber,
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY quantityOrdered * priceEach DESC;

# OR

SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;


 
# WHERE CLAUSE --------------------------------------

/*
The following shows the syntax of the WHERE clause:

SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;
    
    
# Operator Description

=	Equal to. You can use it with almost any data types.
<> or !=	Not equal to ==
<	Less than. You typically use it with numeric and date/time data types.
>	Greater than.
<=	Less than or equal to
>=	Greater than or equal to

# filtering cluase 

1. AND
2. OR
3. LIKE
4. IN 
5. BETWEEN 
6. LIMIT
7. IS NULL 

*/

# 1. find all employees whose job titles are Sales Rep:
select * from employees;

SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep'
order by lastName;

# ----------------------------------
select * from orders;

# 2. find employees whose job titles 
# are Sales Rep and office codes 1


SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
    


# 3. finds employees whose job title is Sales Rep or employees who locate
# the office with office code 1:
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;

# 4. finds employees whose last names end with the string 'son':

SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY firstName;

######################## DAY 1 END 09/11/2021 PGA11 ##############


