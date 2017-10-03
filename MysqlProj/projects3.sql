SELECT TO_CHAR(AVG(SUM(quantity*unitprice-(unitprice*quantity*discount))),'$9,999.99')
FROM orders INNER JOIN orderdetails
ON orders.orderid = orderdetails.orderid
GROUP BY orders.orderid;


SELECT COUNT(SUM(quantity*unitprice-(quantity*unitprice*discount))) AS " # of Orders > AVG AMT"
FROM orders INNER JOIN orderdetails
ON orders.orderid = orderdetails.orderid 
WHERE customerid = 'LILAS'
GROUP BY orders.orderid 
HAVING SUM(quantity*unitprice-(quantity*unitprice*discount)) > 
(SELECT AVG(SUM(quantity*unitprice-(unitprice*quantity*discount))) 
FROM orders INNER JOIN orderdetails 
ON orders.orderid = orderdetails.orderid
GROUP BY orders.orderid);


---------------------------------------------------

1--create sequence
CREATE SEQUENCE Employees_EmployeeID_SEQ
INCREMENT BY 5
start with 100
NOCACHE
NOCYCLE;


savepoint one;

INSERT INTO EMPLOYEES
(EMPLOYEEID, EMPFIRSTNAME, EMPLASTNAME, 
 EMPSTREETADDRESS, EMPCITY, EMPSTATE,EMPZIPCODE, EMPAREACODE,EMPPHONENUMBER)
VALUES
(EMPLOYEES_EMPLOYEEID_SEQ.NEXTVAL, 'Sheldon','Cooper',
'2311 Robles Ave','Pasadena','CA','91101', '323','555-1111');


----Synonyms server as permanent aliases for database objects 
--simplify object references
-- can be private or public
-- private synonyms are only avaliable to the user who created them
--public synonyms are avaliable to all database users

--find max order number being used 
select max(ordernumber) from orders;


select to_char(avg(sum (UNITPRICE*quantity-(unitprice*quantity*discount))),'$9,999.99') as " Avg Total Amount" 
         from orders join orderdetails on orders.ORDERID = orderdetails.ORDERID
group by orders.ORDERID




