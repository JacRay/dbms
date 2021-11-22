CREATE DATABASE New;
USE New;
CREATE TABLE PRODUCT (
  product_no VARCHAR(15) PRIMARY KEY,
  description VARCHAR(15) NOT NULL,
  company VARCHAR(15) NOT NULL,
  price INT NOT NULL
);

CREATE TABLE CUSTOMER (
  cust_no VARCHAR(15) PRIMARY KEY,
  name VARCHAR(15) NOT NULL,
  age INT NOT NULL,
  city VARCHAR(15) NOT NULL,
  pincode INT NOT NULL,
  state VARCHAR(15) NOT NULL
);

CREATE TABLE SUPPLIER (
  s_no VARCHAR(10) PRIMARY KEY,
  sname VARCHAR(15) NOT NULL,
  age INT NOT NULL,
  city VARCHAR(15) NOT NULL
);

CREATE TABLE PURCHASE (
  order_no VARCHAR(15) PRIMARY KEY,
  custno VARCHAR(15) NOT NULL,
  prono VARCHAR(15) NOT NULL,
  quantity INT NOT NULL,
  orderdate DATE
);
-- insert
INSERT INTO PRODUCT VALUES ('P00001', '12 W Flood', 'Wipro', 5000);
INSERT INTO PRODUCT VALUES ('P00002', 'Laptop Adapter', 'Dell', 1560);
INSERT INTO PRODUCT VALUES ('P00003', 'Tablet', 'HCL', 11000);
INSERT INTO PRODUCT VALUES ('P00004', 'Garnet 50W led', 'Wipro', 999);
INSERT INTO PRODUCT VALUES ('P00005', 'Laptop Charger', 'HCL', 1690);

INSERT INTO CUSTOMER VALUES ('C00001', 'Ivan Bayross',35, 'Bombay', 400054,'Maharastra');
INSERT INTO CUSTOMER VALUES ('C00002', 'Vandana Saitwal',35, 'Madras', 780001,'Tamilnadu');
INSERT INTO CUSTOMER VALUES ('C00003', 'Pramada Jaguste',55, 'Bombay', 400057,'Maharastra');
INSERT INTO CUSTOMER VALUES ('C00004', 'Basu Navindgi',45, 'Bombay', 400056,'Maharastra');
INSERT INTO CUSTOMER VALUES ('C00005', 'Ravi Sreedharan',25, 'Delhi', 100001,'Delhi');
INSERT INTO CUSTOMER VALUES ('C00006', 'Rukmini',25, 'Madras', 780001,'Tamilnadu');

INSERT INTO SUPPLIER VALUES ('S001', 'Ivan Bayross',35, 'Bombay');
INSERT INTO SUPPLIER VALUES ('S002', 'Nirmala Agrawal',35, 'Madras');
INSERT INTO SUPPLIER VALUES ('C003', 'Susmitha',55, 'Bombay');
INSERT INTO SUPPLIER VALUES ('C004', 'Basu Navindgi',45, 'Bombay');
INSERT INTO SUPPLIER VALUES ('C005', 'Ravi Sreedharan',25, 'Delhi');
INSERT INTO SUPPLIER VALUES ('C006', 'Nanda Gopal',25, 'Madras');


INSERT INTO PURCHASE VALUES ('O00001', 'C00002', 'P00003', 2,'2016-01-20');
INSERT INTO PURCHASE VALUES ('O00002', 'C00003', 'P00002', 1,'2016-01-27');
INSERT INTO PURCHASE VALUES ('O00003', 'C00006', 'P00001', 3,'2016-02-20');
INSERT INTO PURCHASE VALUES ('O00004', 'C00003', 'P00005', 4,'2016-04-07');
INSERT INTO PURCHASE VALUES ('O00005', 'C00004', 'P00002', 2,'2016-05-22');
INSERT INTO PURCHASE VALUES ('O00006', 'C00005', 'P00004', 1,'2016-05-26');

SELECT * FROM PURCHASE;
SELECT * FROM PRODUCT;
SELECT * FROM CUSTOMER;
SELECT * FROM SUPPLIER;

-- query
-- 1
SELECT * from CUSTOMER where city = 'Madras';
-- 2
SELECT custno FROM PURCHASE WHERE MONTH(orderdate) = 1;
-- 3
SELECT * FROM PRODUCT WHERE price > 5000;
-- 4
SELECT * FROM CUSTOMER WHERE name NOT LIKE 'r%';
-- 5
ALTER TABLE CUSTOMER ADD email VARCHAR(30);
-- 6
SELECT * FROM CUSTOMER WHERE age>40 and state = 'Maharastra';
-- 7
SELECT * FROM PRODUCT ORDER BY price ASC;
-- 8
SELECT AVG(age) FROM CUSTOMER;
-- 9
SELECT distinct city FROM CUSTOMER WHERE state = 'Maharastra' or state = 'Tamilnadu';
-- 10
SELECT AVG(price) FROM PRODUCT;
-- 11
SELECT CUSTOMER.* from CUSTOMER, PURCHASE  WHERE CUSTOMER.cust_no = PURCHASE.custno ORDER BY quantity;
-- 12
UPDATE PURCHASE SET prono = 'P00008' WHERE custno = 'C00003';
-- 13
SELECT COUNT(*) as cust_count FROM CUSTOMER  WHERE city="Delhi";
-- 14
SELECT cust_no,quantity FROM PURCHASE  WHERE quantity > 3;
-- 15
ALTER TABLE PURCHASE MODIFY (orderdate char);
-- 16
SELECT MIN(price)as min_price , MAX(price) as max_price FROM PRODUCT;
-- 17
SELECT COUNT(product_no) as comp_count,company FROM PRODUCT WHERE company IN ('HCL','Wipro') GROUP BY company;
-- 18
SELECT * FROM CUSTOMER ORDER BY name;
-- 19
SELECT * FROM PURCHASE ORDER BY orderdate;
-- 20
DELETE FROM PRODUCT WHERE product_no= 'P00003';
-- 21
CREATE TABLE ordertable
  ( order_no VARCHAR(30),
    orderdate DATE
   );
   
INSERT INTO ordertable(order_no,orderdate) SELECT order_no,orderdate FROM PURCHASE;
-- 22
DROP TABLE ordertable;
-- 23
CREATE VIEW CUST AS SELECT * FROM CUSTOMER;
-- 24
SELECT name FROM CUSTOMER WHERE cust_no IN (SELECT cust_no FROM PURCHASE WHERE quantity > 1);
-- 25
SELECT * 
FROM PURCHASE INNER JOIN CUSTOMER WHERE  CUSTOMER.state in (SELECT  state from CUSTOMER 
GROUP BY state HAVING count(*) >1 ) AND PURCHASE.custno=CUSTOMER.cust_no;
-- 26
SELECT name FROM CUSTOMER WHERE name like 'R%';
-- 27
SELECT DISTINCT name from (SELECT name FROM customer UNION SELECT sname FROM supplier) as name;

