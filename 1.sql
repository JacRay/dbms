-- create
CREATE TABLE PRODUCT (
  product_no VARCHAR(15) PRIMARY KEY,
  description VARCHAR(15) NOT NULL,
  company VARCHAR(15) NOT NULL
);

CREATE TABLE CUSTOMER (
  cust_no VARCHAR(15) PRIMARY KEY,
  name VARCHAR(15) ,
  age INT NOT NULL,
  city VARCHAR(15) NOT NULL,
  pincode INT NOT NULL,
  state VARCHAR(15) NOT NULL
);

CREATE TABLE PRODUCT (
  product_no VARCHAR(15) PRIMARY KEY,
  description VARCHAR(15) NOT NULL,
  company VARCHAR(15) NOT NULL,
);

CREATE TABLE PURCHASE (
  order_no INT PRIMARY KEY,
  custno INT NOT NULL,
  prono VARCHAR(15) NOT NULL,
  quantity INT NOT NULL,
  FOREIGN KEY(cust_no) REFERENCES 
);
