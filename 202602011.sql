play_ddlSELECT * FROM users u CROSS JOIN orders o ORDER BY u.id;

SELECT u.id, u.username, u.country, s.last_name, s.first_name FROM users u inner JOIN staff s ON u.id = s.user_id;

SELECT s.id, s.last_name, o.id, o.order_date FROM staff s LEFT JOIN orders o ON s.id = o.staff_id WHERE s.id IN (3, 5);

SELECT u.country, COUNT(DISTINCT o.id) AS 담당주문 FROM users u LEFT JOIN orders o ON u.id = o.user_id GROUP BY u.country ORDER BY 담당주문 DESC;

SELECT o.user_id, round(SUM(price * quantity), 2) AS 정상합, round(SUM(discount_price * quantity), 2) AS 할인합 FROM orders o LEFT JOIN orderdetails od ON o.id = od.order_id INNER JOIN products p ON od.product_id = p.id GROUP BY o.user_id ORDER BY 정상합 DESC;

(
	SELECT * 
		FROM users
) 
UNION ALL
(
	SELECT * 
		FROM users
)
ORDER BY id;

(SELECT id, phone, country, city FROM users)
UNION ALL
(SELECT id, phone, country, city FROM users)
ORDER BY id;

SELECT id, phone, city, country FROM users WHERE country = 'Korea' UNION ALL SELECT id, phone, city, country FROM users WHERE country = 'Mexico' ORDER BY country;

SELECT * FROM orders WHERE order_date >='2015-10-01' AND order_date < '2015-11-01' UNION ALL SELECT * FROM orders WHERE order_date >= '2015-12-01' AND order_date < '2016-01-01' ORDER BY order_date DESC;

SELECT id AS 회원아이디, phone AS 연락처, country AS 거주국가, city AS 거주도시, is_marketing_agree AS 마케팅수신동의 FROM users WHERE country = 'USA' AND is_marketing_agree = 1 UNION ALL SELECT id AS 회원아이디, phone AS 연락처, country AS 거주국가, city AS 거주도시, is_marketing_agree AS 마케팅수신동의 FROM users WHERE country = 'France' AND is_marketing_agree = 0 ORDER BY 거주국가;

SELECT * FROM orderdetails o LEFT JOIN products p ON o.product_id = p.id UNION SELECT * FROM orderdetails o RIGHT JOIN products p ON o.product_id = p.id;

SELECT name, price, (SELECT ROUND(AVG(price), 2) FROM products) AS 평균가격 
	FROM products; 
	
SELECT ROUND(AVG(price), 2) AS 평균가격 FROM products;

SELECT name, price, 38.8 AS 평균가격 
	FROM products;	
	
SELECT name, price, AVG(price) AS 평균가격 FROM products;

SELECT city, COUNT(DISTINCT id) AS 회원수 
	FROM users 
	GROUP BY city 
	HAVING COUNT(DISTINCT id) > 2 	
	ORDER BY 회원수 DESC;
	
SELECT city, COUNT(DISTINCT id) AS 도시별회원수
    FROM users
    GROUP BY city;
    
SELECT *
  FROM (
    SELECT city, COUNT(DISTINCT id) AS 도시별회원수
      FROM users
      GROUP BY city
  ) a
  WHERE 도시별회원수 >= 3
  ORDER BY 도시별회원수 DESC;
  
SELECT * FROM orders;

SELECT * 
  FROM orders 
  WHERE staff_id IN (
    SELECT id FROM staff WHERE last_name IN ('Kyle', 'Scott')
  );
  
SELECT * FROM staff;

SELECT * 
  FROM orders 
  WHERE (staff_id, user_id) IN (
    SELECT id, user_id FROM staff WHERE last_name IN ('Kyle', 'Scott')
  );
  
SELECT * FROM products WHERE discount_price IN (SELECT MAX(discount_price) FROM products);

SELECT * FROM products WHERE discount_price = (SELECT MAX(discount_price) FROM products);

SELECT * 
  FROM (
    SELECT * FROM orders WHERE order_date >= '2015-07-01' AND order_date < '2015-08-01'
  ) o
  INNER JOIN
  (
    SELECT * FROM orderdetails WHERE quantity > 49
  ) od
  ON o.id = od.order_id;
  
SELECT * FROM orders o INNER JOIN orderdetails od ON o.id = od.order_id WHERE (o.order_date >= '2015-07-01' AND o.order_date < '2015-08-01') AND (od.quantity > 49);


-- 1.
SELECT *, ROUND(discount_price / (SELECT MAX(discount_price) FROM products), 3) AS ratioPerMaxPrc FROM products;

SELECT MAX(discount_price) FROM products;

-- 2.
SELECT u.id, u.phone, u.country, s.id, s.last_name, s.first_name
  FROM (
    SELECT * FROM users WHERE country IN ('Korea', 'Italy')
  ) u
  INNER JOIN
  (
    SELECT * FROM staff WHERE birth_date < '1990-01-01'
  ) s
  ON u.id = s.user_id;
-- 3.
SELECT * FROM ( SELECT country, COUNT(DISTINCT id) AS 국가별회원수 FROM users GROUP BY country ) u
WHERE 국가별회원수 > 4
ORDER BY 국가별회원수 DESC;



-- 4.
SELECT * FROM products WHERE price IN ( SELECT MIN(price) FROM products) ;

-- 5.
SELECT * FROM users WHERE id IN ( SELECT user_id FROM orders WHERE SUBSTR(order_date, 1, 4) = '2016' );

SELECT * FROM users WHERE id IN ( SELECT user_id FROM orders WHERE order_date BETWEEN '2016-01-01' AND '2016-12-31');