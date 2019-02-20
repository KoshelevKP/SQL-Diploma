CREATE TABLE
Products (
  Product_id float(25),
  Product_name VARCHAR(355),
  Component_id float(25),
  Component_name VARCHAR(355),
  Component_weight float(25)
);

CREATE TABLE
Component_quality (
  Component_id float(25),
  Component_name VARCHAR(355),
  RCL float(25),
  PAR float(25),
  V_100C float(25)
);

CREATE TABLE
price (
  id float(25),
  name VARCHAR(355),
  price float(25)
);

CREATE TABLE
sales_plan (
  Product_id float(25),
  name VARCHAR(355),
  weight float(25)
);


INSERT INTO
    Products 
VALUES
  (98, 'petrol 98', 11, 'MTB', 300),
  (98, 'petrol 98', 22, 'alkylate', 300),
  (98, 'petrol 98', 33, 'Butane', 400),
  (98, 'petrol 98', 44, 'straight-run gasoline', 500),
  (95, 'petrol 95', 11, 'MTB', 12000),
  (95, 'petrol 95', 22, 'alkylate', 25000),
  (95, 'petrol 95', 33, 'Butane', 30000),
  (95, 'petrol 95', 44, 'straight-run gasoline', 45000),
  (92, 'petrol 92', 11, 'MTB', 9500),
  (92, 'petrol 92', 22, 'alkylate', 19400),
  (92, 'petrol 92', 33, 'Butane', 35000),
  (92, 'petrol 92', 44, 'straight-run gasoline', 60000);

INSERT INTO
    Component_quality 
VALUES
  (11, 'MTB', 120, 100, 100),
  (22, 'alkylate', 110, 0, 95),
  (33, 'Butane', 95, 100, 60),
  (44, 'straight-run gasoline', 80, 9, 100);

INSERT INTO
    price 
VALUES
  (11, 'MTB', 1300),
  (22, 'alkylate', 1150),
  (33, 'Butane', 1050),
  (44, 'straight-run gasoline', 1000),
  (98, 'petrol 98', 1200),
  (95, 'petrol 95', 1150),
  (92, 'petrol 92', 1100);

INSERT INTO
    sales_plan
VALUES
  (98, 'petrol 98', 2000),
  (95, 'petrol 95', 112000),
  (92, 'petrol 92', 123900);

