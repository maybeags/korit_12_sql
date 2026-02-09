SELECT * FROM users ORDER BY id ASC;

SELECT * FROM users ORDER BY id DESC;

SELECT * FROM users ORDER BY created_at DESC;

SELECT * FROM users ORDER BY 1 DESC;

SELECT username, phone, city, country, id FROM users ORDER BY 1 ASC;

SELECT city, id FROM users ORDER BY city DESC, id ASC;

SELECT * FROM products ORDER BY price DESC;

SELECT * FROM orders ORDER BY order_date DESC;

SELECT * FROM orderdetails ORDER BY product_id DESC, quantity ASC;

SELECT COUNT(id) AS cnt FROM orderdetails;

SELECT COUNT(country) FROM users;

SELECT COUNT(DISTINCT country) AS countries FROM users;

SELECT DISTINCT country AS countries FROM users;

SELECT MIN(price) FROM products;

SELECT MAX(discount_price) FROM products;

SELECT ROUND(SUM(price), 2) FROM products;

SELECT ROUND(AVG(price), 2) AS avgPrice FROM products;

SELECT SUBSTR(created_at, 1, 10) FROM users;

SELECT 
	SUBSTR(created_at, 1, 10) AS day
	, SUBSTR(created_at, 1, 7) AS month 
	, created_at 
	FROM users
	;
	
SELECT LENGTH(username) AS len, username FROM users ORDER BY len;

SELECT ROUND(SUM(price), 2) AS 합계 FROM products;

SELECT ROUND(AVG(price), 2) AS 평균 
  FROM products 
  WHERE id < 31
;

SELECT COUNT(DISTINCT id) FROM users WHERE SUBSTR(created_at,1,7) BETWEEN '2010-10' AND '2010-12'
;

SELECT * FROM users ORDER BY created_at;

SELECT COUNT(DISTINCT username) FROM users WHERE LENGTH(username) < 18;

SELECT username FROM users ORDER BY username;

SELECT COUNT(id) FROM users WHERE country = 'Korea';
SELECT COUNT(id) FROM users WHERE country = 'USA';

SELECT COUNT(id) FROM users WHERE country IN ('Korea', 'USA');

SELECT COUNT(DISTINCT id) AS 국가별유저수 FROM users GROUP BY country;

SELECT COUNT(DISTINCT country) FROM users;

SELECT COUNT(DISTINCT id) from users WHERE country = 'Korea' AND is_marketing_agree = 1;

SELECT COUNT(DISTINCT id) from users WHERE country = 'UK' AND is_marketing_agree = 1;

SELECT country, is_marketing_agree AS 동의여부, COUNT(DISTINCT id) AS 동의사용자
  FROM users
  GROUP BY country, is_marketing_agree
  ORDER BY country, 동의사용자 DESC
  ;