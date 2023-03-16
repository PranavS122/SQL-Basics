# 5 To find employees whose first names start with  T, 
# end with m, and contain any single character between e.g., Tom , Tim T%m

# 6. find all employees whose last names contain on
# 1 %
# 2. _



# 5 To find employees whose first names start with  T, 
# end with m, and contain any single character between e.g., Tom , Tim T%m

SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';
    
# 6. find all employees whose last names contain on
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';

# 7. finds customers who locate in 
# California, USA, and have the credit limit greater than 100K.

SELECT    
	customername, 
	country, 
	state, 
	creditlimit
FROM    
	customers
WHERE country = 'USA'
	and state = 'CA'
	AND creditlimit > 100000;

    
# 8. finds customers who locate in 
# California or USA, and have the credit limit greater than 10K.
select * from customers;

SELECT 
    customername, country, creditLimit
FROM
    customers
WHERE
    country = 'USA'
        or country = 'France'
        AND creditlimit > 10000;
        
        
# 9. select orders from givin order number (10165,10287,10310) ;
select * from orders; 
 SELECT 
    orderNumber, 
    customerNumber, 
    status, 
    shippedDate
FROM
    orders
WHERE
    orderNumber IN (10165,10287,10310);       
    
# 10. find products whose buy prices us between  90 and 100:
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;  
    
 -- buyPrice >= 90 AND buyPrice <= 100;


 # 11. find top five customers who have the highest credit:
select * from customers;
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;
 
 # 12.  find customers who do not have a sales representative
 select * from customers;
 
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL   # is to check as to convert 
ORDER BY 
    customerName;
    
 # 13.  find customers who have a sales representative
 
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
    customerName;
 
# DISTINCT CLAUSE ---------------------------------------------
/*
Here is the syntax of the DISTINCT clause:

SELECT DISTINCT
    select_list
FROM
    table_name;
*/

# 1. select unique last names from the employess table
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY
    lastname;

# 2. get a unique combination of city and state from the customers table

SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
  
 -- select * from  classicmodels.customers;
    
-- select * from customers;

# Managing MySQL databases and tables ------------------------------------------

#  list all database
show databases;

# select database
use classicmodels;

# get name of current database
select database();

/*
To create a database in MySQL, you use the CREATE DATABASE  statement as follows:

CREATE DATABASE [IF NOT EXISTS] database_name;

To delete a database, you use the DROP DATABASE statement as follows:

DROP DATABASE [IF EXISTS] database_name;
*/

# create database
CREATE DATABASE mydeb;
CREATE DATABASE IF NOT EXISTS mydeb;

# drop database
CREATE DATABASE IF NOT EXISTS TEMP;
SHOW DATABASES;
DROP DATABASE mydeb;
DROP DATABASE IF EXISTS mydeb;

drop database classicmodels;



######################## DAY 2 END 10/11/2021 PGA11 ##############
