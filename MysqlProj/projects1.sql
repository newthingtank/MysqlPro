select productid, unitprice from products;

create view CustomerOrders
AS
SELECT custfirstname, custlastname, ordernumber, orderdate
from customers join orders on
customers.customerid = orders.customerid
;


SELECT Customers.CustomerID,
      CUSTOMERS.CUSTFIRSTNAME,
      CUSTOMERS.CUSTLASTNAME
FROM CUSTOMERS
WHERE EXISTS
(SELECT * FROM ORDERS INNER JOIN
ORDER_DETAILS ON ORDERS.ORDERNUMBER = ORDER_DETAILS.ORDERNUMBER
INNER JOIN Products ON Products.productnumber = order_details.productnumber
where products.categoryid = 2 and orders.customerid = orders.customerid);


CREATE VIEW VQ1
AS
SELECT PRODUCTID, PRODUCTNAME,UNITPRICE
from products
where unitprice > (select avg(unitprice) from products);
SELECT * FROM VQ1;
drop view vq1;
SELECT orders.ordernumber, orders.orderdate, orders.shipdate,
(SELECT customers.custlastname from customers where
 customers.customerid=orders.customerid)AS Customer
 from orders where orders.shipdate = '2007-10-03';

--ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

create view VQ2
AS
SELECT ORDERID,ORDERDATE,(SELECT customers.companyname FROM CUSTOMERS where orders.customerid = customers.customerid) as companyname
from orders ;

SELECT * FROM VQ2;



DROP VIEW VQ2;


create view VQ2
AS
SELECT ORDERID, orderdate,(SELECT customers.companyname FROM CUSTOMERS where orders.customerid = customers.customerid) as companyname
from orders where orders.orderdate = '10-Feb-07';


