########################   DAY 5 ##################################

# MySQL Joins ----------------------------------

/*

MySQL supports the following types of joins:

1. Inner join
2. Left join
3. Right join
4. Cross join

*/


# 1. create sample table meber and committes
use classicmodels;

CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

INSERT INTO members(`name`)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

SELECT * FROM members;
SELECT * FROM committees;

# 1. INNER JOIN -----

/*
The following shows the basic syntax 
of the inner join clause that joins two tables table_1 and table_2:

SELECT column_list
FROM table_1
INNER JOIN table_2 ON join_condition;

If the join condition uses the equal operator (=) 
and the column names in both tables used 
for matching are the same, you can use the USING clause instead:

SELECT column_list
FROM table_1
INNER JOIN table_2 USING (column_name);

*/

# 1. finds members who are also the committee members:


SELECT 
    m.member_id, 
    m.name as `m name`, 
    c.committee_id, 
    c.name as `c name`
FROM
    members m
INNER JOIN committees c 
	ON c.name = m.name;


SELECT 
	m.member_id, 
    m.name members, 
    c.committee_id, 
    c.name committee
FROM
    members m
INNER JOIN committees c 
	ON c.name = m.name;

# OR 

SELECT 
    m.member_id, 
    m.name AS members , 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c USING(name);

# 2. LEFT JOIN -----

/*
The following shows the basic syntax 
of the inner join clause that joins two tables table_1 and table_2:

SELECT column_list 
FROM table_1 
LEFT JOIN table_2 ON join_condition;

If the join condition uses the equal operator (=) 
and the column names in both tables used 
for matching are the same, you can use the USING clause instead:

SELECT column_list 
FROM table_1 
LEFT JOIN table_2 USING (column_name);

*/

SELECT 
    m.member_id, 
    m.name AS members, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name);



# 3. RIGHT JOIN -----

/*
The following shows the basic syntax 
of the inner join clause that joins two tables table_1 and table_2:

SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 ON join_condition;

If the join condition uses the equal operator (=) 
and the column names in both tables used 
for matching are the same, you can use the USING clause instead:

SELECT column_list 
FROM table_1 
RIGHT JOIN table_2 ON join_condition;

*/

SELECT 
    m.member_id, 
    m.name AS members, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;


# 4. CROSS JOIN 

/*
The following shows the basic syntax of the cross join clause:

SELECT select_list
FROM table_1
CROSS JOIN table_2;

*/

SELECT 
    m.member_id, 
    m.name AS  members, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
CROSS JOIN committees c;

# 1. select productCode and productName from the products table.
# textDescription of product lines from the productlines table.

SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;

# 2. return order number, order status and 
# total sales from the orders 
# and orderdetails tables using the 
# INNER JOIN clause with the GROUP BYclause:

SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

# 3. uses two INNER JOIN clauses to join three tables: orders, orderdetails, and products:

SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;

# 4. uses three INNER JOIN clauses to query data from the four tables

SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
# 5. use the LEFT JOIN clause to find all customers and their orders:

SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;
    
# 6. use two LEFT JOIN clauses to join the three tables: employees, customers, and payments.

SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber; 

# 7.  use the RIGHT JOIN clause join the table customers with the table employees

SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;

# 8. use the RIGHT JOIN clause to find employees who do not in charge of any customers:


SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;

# 9. To get the whole organization structure, you can join the 
# employees table to itself using the employeeNumber and reportsTo columns. 
# The table employees has two roles: one is the Manager and the other is Direct Reports.

select * from employees;


SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    


## MySQL Subquery ------------------------

# 1. select all the employees who work in offices located in the USA.



SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
# 2. select customer who ahs the maximum payment


SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
    
select * from customers where customerNumber = (SELECT 
    customerNumber
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments));
    
# 3. find customers whose payments are greater 
# than the average payment using a subquery

SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            payments);


# 4.  find the customers who have not placed any orders

SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);
