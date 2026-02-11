SELECT * FROM users GROUP BY id;

SELECT country, COUNT(DISTINCT id) AS 국가별사용자수
  FROM users
  WHERE country IN ('Korea', 'Spain')
  GROUP BY country
  ;

SELECT COUNT(DISTINCT id) AS 한국및미국동동의자수
  FROM users WHERE country IN ('Korea', 'USA') AND is_marketing_agree = 1
  ;
  
SELECT country AS 국가, is_marketing_agree AS 마케팅수신동의, COUNT(DISTINCT id) AS 회원수 
  FROM users
  GROUP BY 국가, 마케팅수신동의
  ORDER BY country, 회원수 DESC
  ;
  
SELECT country AS 국가, city AS 도시, COUNT(DISTINCT id) AS 회원수
  FROM users
  GROUP BY country, city
  ORDER BY 국가, 회원수 DESC, city
  ;
  
SELECT SUBSTR(created_at, 1, 7) AS 월별, COUNT(DISTINCT id) AS 회원수
  FROM users
  GROUP BY SUBSTR(created_at, 1, 7)
  ORDER BY 월별 DESC
  ;
  
SELECT order_id, SUM(quantity) AS 주문합계 FROM orderdetails GROUP BY order_id ORDER BY 주문합계 DESC;  
  
SELECT staff_id, user_id, COUNT(DISTINCT id) AS 주문건수 FROM orders GROUP BY staff_id, user_id ORDER BY staff_id, 주문건수 DESC;

SELECT SUBSTR(order_date, 1, 7) AS 월별, COUNT(DISTINCT user_id) AS 월별주문회원수 FROM orders GROUP BY SUBSTR(order_date, 1, 7) ORDER BY 월별 DESC;

SELECT country, COUNT(DISTINCT id) AS 국가별회원수
  FROM users
  WHERE country IN ('Korea', 'France', 'USA')
  GROUP BY country
  ;
  
  
SELECT country, COUNT(DISTINCT id) AS 국가별회원수
  FROM users
  GROUP BY country
  HAVING COUNT(DISTINCT id) > 7
  ORDER BY 국가별회원수 DESC
  ;
  
  
SELECT staff_id AS 직원아이디
  , COUNT(DISTINCT id) AS 주문건수
  , COUNT(DISTINCT user_id) AS 주문회원수
  FROM orders
  GROUP BY 직원아이디
  HAVING 주문건수 > 9 AND 주문회원수 < 41
  ORDER BY 주문건수 DESC;
  
SELECT user_id AS 사용자아이디, COUNT(DISTINCT id) AS 주문건수 
	FROM orders 
	GROUP BY user_id 
	HAVING 주문건수 >= 7 
	ORDER BY 주문건수 DESC;

SELECT country AS 국가, COUNT(DISTINCT city) AS 도시, COUNT(DISTINCT id) AS 회원수 
	FROM users 
	GROUP BY country 
	HAVING 도시 >= 5 AND 회원수 >= 3 
	ORDER BY 도시 DESC, 회원수 DESC;
	
SELECT country AS 국가, COUNT(DISTINCT Id) AS 회원수 
	FROM users 
	WHERE country IN ("USA", "Brazil", "Korea", "Argentina", "Mexico") 
	GROUP BY country 
	HAVING 회원수 >= 5 
	ORDER BY 회원수 DESC;
	
SELECT *
  FROM users u LEFT JOIN orders o ON u.id = o.user_id ORDER BY u.id;
  
SELECT *
  FROM users u INNER JOIN orders o ON u.id = o.user_id ORDER BY o.id;
  
SELECT u.id AS 유저아이디, u.username, u.created_at, u.is_marketing_agree, u.country, u.city, o.id AS 주문아이디, o.staff_id, o.order_date FROM users u INNER JOIN orders o ON u.id = o.user_id;

SELECT *
  FROM users u LEFT JOIN orders o
  ON u.id = o.user_id
  ;  
  
  
SELECT *
  FROM users u LEFT JOIN orders o ON u.id = o.user_id
  WHERE o.id IS null;  
  
SELECT * FROM orders;

SELECT u.id, u.username, u.phone, o.id, od.product_id
	FROM users u LEFT JOIN orders o ON u.id = o.user_id 
	INNER JOIN orderdetails od ON o.id = od.order_id;
  
SELECT *
  FROM users u RIGHT JOIN orders o
  ON u.id = o.user_id
  ORDER BY o.id
  ;    
  
SELECT *
  FROM users u JOIN orders o
  ON u.id = o.user_id
  ORDER BY o.id
  ; 
  
  
  
  
  
  
  
  
  
  