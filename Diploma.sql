-- 1 Общий план по продажам
SELECT
    SUM(weight) as All_weight
FROM sales_plan;

-- 2 Общий вес продуктов
SELECT
    product_id,
    SUM(Component_weight) as weight
FROM products
GROUP BY product_id
;

-- 3 Спецификация копонентов в продуктах
SELECT *
FROM products
JOIN 
     Component_quality 
    ON products.Component_id =Component_quality .Component_id
;

-- 4 Общий вес компонентов
SELECT
    Component_id, Component_name,
    SUM(Component_weight) as weight
FROM products
GROUP BY Component_id, Component_name
;

-- 5 Рецепт продукта petrol 95
WITH products_quality
AS (
    SELECT *
FROM products
    WHERE product_id=95
) 
SELECT
    product_id, product_name,component_id,Component_name,
    (Component_weight/SUM(Component_weight) OVER (PARTITION BY  product_id)) percent
FROM
    products_quality
;

-- 6 Спецификация продукта petrol 95
WITH products_quality
AS (
    SELECT *
FROM products
JOIN 
     Component_quality 
    ON products.Component_id =Component_quality .Component_id
    WHERE product_id=95
) 
SELECT
    Product_id, Product_name,
    (SUM(Component_weight*rcl) OVER (PARTITION BY  product_id))/(SUM(Component_weight) OVER (PARTITION BY  product_id)) Product_RCL,
    (SUM(Component_weight*par) OVER (PARTITION BY  product_id))/(SUM(Component_weight) OVER (PARTITION BY  product_id)) Product_PAR,
    (SUM(Component_weight*v_100c) OVER (PARTITION BY  product_id))/(SUM(Component_weight) OVER (PARTITION BY  product_id)) Product_V_100C   
FROM
    products_quality
LIMIT 1
;

-- 7 Отклонение от плана
WITH products_plan
AS (
SELECT
    product_id,
    SUM(Component_weight) as weight
FROM products
GROUP BY product_id
)
SELECT
    *
FROM
    products_plan
JOIN 
     sales_plan
    ON products_plan.product_id =sales_plan.product_id
;

-- 8 доход
WITH sales
AS (
SELECT
    *
FROM products
JOIN 
     price
    ON products.product_id =price.id
)
SELECT
    SUM(component_weight*price)
FROM
    sales
;

-- 9 Расходы
WITH sales
AS (
SELECT
    *
FROM products
JOIN 
     price
    ON products.component_id =price.id
)
SELECT
    SUM(component_weight*price)
FROM
    sales
;

-- 10 Прибыль
WITH sales
AS (
SELECT
    products.product_id, products.component_id, products.component_weight,
    price.price
FROM products
JOIN 
     price
    ON products.product_id =price.id
)
SELECT
   SUM(sales.component_weight*sales.price)-SUM(sales.component_weight*price.price) as profit
FROM
    sales
JOIN 
     price
    ON sales.component_id =price.id
;    