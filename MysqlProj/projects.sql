drop table products cascade CONSTRAINTS;
create table products 
(
       PRODUCTID         NUMBER (8, 0) NOT NULL,
       PRODUCTNAME      VARCHAR2 (40) NOT NULL,
       SUPPLIERID         NUMBER (8, 0),
       CATEGORYID        NUMBER (8, 0),
       QUANTITYPERUNIT   VARCHAR2 (20),
       UNITPRICE           NUMBER (8, 2),
       UNITSINSTOCK       NUMBER (6, 0),
       UNITSONORDER       NUMBER (6, 0),
       REORDERLEVEL       NUMBER (6, 0),
       DISCONTINUED       NUMBER (1, 0) NOT NULL,
       CONSTRAINT products_PRODUCTID_PK PRIMARY KEY(PRODUCTID),
       constraint products_suppliers_fk foreign key(supplierid)
       references suppliers(supplierid),
       constraint products_categories_fk foreign key(categoryid)
       references categories(categoryid),
       constraint products_unitprice_ck check(unitprice>=0),
       constraint products_reorderLevel_ck check(reorderLevel>=0),
       constraint products_unitsInStock_ck check(unitsInStock>=0),
       constraint products_unitsonorder_ck check(unitsonorder>=0)
      );
      insert into 
DROP TABLE CATEGORIES CASCADE CONSTRAINTS;
Create Table categories 
  (CATEGORYID       NUMBER (8, 0) NOT NULL,
   CATEGORYNAME   VARCHAR2 (15) NOT NULL,
   DESCRIPTION      VARCHAR2 (300),
   CATEGORYCODE    NUMBER(6,0),
   CONSTRAINT CATEGORIES_CATEGORYID_pk PRIMARY KEY (CATEGORYID),
   CONSTRAINT CATEGORIES_CATEGORYCODE_UK UNIQUE(CATEGORYCODE)
   );
   
   --1--
   select productid, productname, UNITSINSTOCK from products
   where unitsinstock between 50 and 100
   order by unitsinstock desc;
   
   --2--
   SELECT*FROM CUSTOMERS ORDER BY COUNTRY, CITY;
   
   --3--
   SELECT ORDERID, CONTACTNAME FROM ORDERS JOIN CUSTOMERS
   ON ORDERS.CUSTOMERID = CUSTOMERS.CUSTOMERID
   WHERE EMPLOYEEID = 5;
   
   --4--
   SELECT DISTINCT CATEGORYNAME FROM CATEGORIES C
   INNER JOIN PRODUCTS P ON C.CATEGORYID=P.CATEGORYID
   INNER JOIN ORDERDETAILS OD ON P.PRODUCTID=OD.PRODUCTID
   AND OD.ORDERID=10623
   ORDER BY CATEGORYNAME;
   
   --5--
   INSERT INTO PRODUCTS(productid, productname,SUPPLIERID,CATEGORYID,QUANTITYPERUNIT,UNITPRICE,UNITSINSTOCK,
   UNITSONORDER,REORDERLEVEL,DISCONTINUED) VALUES (78, 'Super Frankfurter', 15, 9,'12 boxes', 13.0000,32, 
   0, -15,0);
   
   INSERT INTO PRODUCTS(productid, productname,SUPPLIERID,CATEGORYID,QUANTITYPERUNIT,UNITPRICE,UNITSINSTOCK,
   UNITSONORDER,REORDERLEVEL,DISCONTINUED) VALUES (78, 'Super Frankfurter', 15, 9,'12 boxes', 13.0000,32, 
   0, 15,0);
   --7--
   SELECT CompanyName, CategoryName, ProductName, UnitPrice
   From Suppliers s INNER JOIN Products P ON s.SupplierID = P.SUPPLIERID
   INNER JOIN CATEGORIES C ON P.CATEGORYID = C.CATEGORYID
   ORDER BY CATEGORYNAME, UNITPRICE DESC;
   
   --8--
   SELECT DISTINCT P1.PRODUCTNAME, P1.UNITPRICE
   FROM PRODUCTS P1 INNER JOIN PRODUCTS P2
   ON P1.UNITPRICE = P2.UNITPRICE
   AND P1.PRODUCTID<>P2.PRODUCTID
   ORDER BY P1.UNITPRICE DESC;