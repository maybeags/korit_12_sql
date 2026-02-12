-- 1. CREATE : 테이블 생성
-- CREATE TABLE students (
-- 	student_id INT AUTO_INCREMENT primary KEY,
-- 	full_name VARCHAR(50) NOT NULL,
-- 	email VARCHAR(100) UNIQUE,
-- 	birth_date DATE,
-- 	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );
-- -- 컬럼 추가할 때
-- ALTER TABLE students ADD phone VARCHAR(20);
-- 
-- -- 컬럼 데이터 타입 수정
-- ALTER TABLE students MODIFY COLUMN full_name VARCHAR(100); 

-- 테이블 삭제
-- DROP TABLE students;

-- INSERT
-- row 하나만 삽입한 예시
-- INSERT INTO students (full_name, email, birth_date)
-- 	VALUES ('김일', 'kim1@test.com', '2026-02-12');
-- 여러 row 한 번에 삽입
-- INSERT INTO students (full_name, email)
-- 	VALUES ('김이', 'kim2@test.com'),
-- 			('김삼', 'kim3@test.com');	


-- UPDATE
-- UPDATE students SET birth_date = '1990-01-01'
-- 	WHERE student_id = 2;

-- UPDATE students SET phone = '010-7445-7113'
-- 	WHERE student_id = 3;

-- INSERT INTO students (full_name, email, phone) 
-- 	VALUES ('실수', 'mistake@test.com', '010-1234-5678');

-- DELETE : 데이터 삭제
-- DELETE FROM students WHERE student_id = 4;
	
-- INSERT INTO students2 (full_name, email) VALUES ('박일', 'park1@test.com');

-- INSERT INTO students2 (email) VALUES ('test@test.com');

-- UPDATE students2 SET 
-- 	full_name = '안근수', 
-- 	email = 'maybeags@github.com', 
-- 	birth_date = '1988-07-09', 
-- 	phone = '010-7445-7113'
-- 	WHERE student2_id = 2;

-- SELECT * FROM students;

-- 2번 id에 해당하는 row를 여러분 프로필로 수정하시오. 

-- CREATE TABLE courses (
-- 	course_id INT AUTO_INCREMENT PRIMARY KEY,
-- 	course_name VARCHAR(100) NOT NULL,
-- 	professor VARCHAR(50),
-- 	credits INT DEFAULT 3
-- );
-- 


-- INSERT INTO courses ( course_name, professor, credits ) 
-- 	VALUES ('데이터베이스기초', '강교수', 3), 
-- 			('자바프로그래밍', '이교수', 4),
-- 			('웹디자인', '박교수', 2);
-- 
-- INSERT INTO students (full_name, email, birth_date, phone) VALUES
-- ('kim1', 'kim1@test.com', '1990-01-01', '010-1234-5678'),
-- ('kim2', 'kim2@test.com', '2000-12-31', '010-9876-5432');
-- 
-- 
-- INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES 
-- (1, 1, '2026-02-01'),
-- (1, 2, '2026-02-01'),
-- (2, 1, '2026-02-02');
-- 김일 학생이 수강하고 있는 과목을 표시하고 등록 날짜도 표시하고 그 교수 이름도 출력하시오.

-- SELECT s.full_name, c.course_name, c.professor, e.enrollment_date
-- 	FROM students s 
-- 	JOIN enrollments e ON s.student_id = e.student_id	-- 웬만하면 왼쪽에 pk를 써주고 오른쪽 fk
-- 	JOIN courses c ON c.course_id = e.course_id
-- 	WHERE s.student_id = 1;

-- create : INSERT
-- INSERT INTO students (full_name, email, birth_date, phone)
-- VALUES ('박지민', 'park@test.com', '1995-05-05', '010-5555-6666');
-- 
-- SELECT * FROM students;

-- INSERT INTO courses (course_name, professor) VALUES ('파이썬 프로그래밍', '최교수');
-- default라서 credit입력 안했습니다.

-- INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES 
-- 	(3, 4, '2026-02-12'), 
-- 	(3, 1, '2026-02-12');


-- SELECT
-- SELECT course_name FROM courses WHERE professor = '이교수';
-- 
-- SELECT full_name, email FROM students WHERE email LIKE '%test.com';
-- 
-- SELECT s.full_name, e.enrollment_date 
-- 	FROM students s 
-- 		INNER JOIN enrollments e ON s.student_id = e.student_id 
-- 		INNER JOIN courses c ON c.course_id = e.course_id 
-- 	WHERE course_name = '데이터베이스기초';

-- UPDATE students SET phone = '010-1597-7533' WHERE full_name = 'kim2';
-- 
-- SELECT * FROM students;

-- UPDATE courses SET professor = '김교수' WHERE course_name = '웹디자인';

-- 모든 과목 1 학점 증가 -  where절이 없으므로 모든 credits의 값들에 1씩 더해졌습니다.
-- UPDATE courses SET credits = credits + 1;

-- SELECT * FROM courses;

-- DELETE 
-- DELETE FROM students WHERE full_name = 'kim2'; -- 이대로는 실패합니다.

-- FK에 있는 값부터 삭제하겠습니다.
-- DELETE FROM enrollments	WHERE student_id = 2; -- 얘도 답이긴 합니다.

-- DELETE FROM enrollments WHERE student_id = (SELECT student_id FROM students WHERE full_name = 'kim2');
-- 
-- SELECT * FROM enrollments;

-- 그래서 이제 students에서도 삭제가 가능합니다.
-- DELETE FROM students WHERE full_name = 'kim2';
-- 
-- SELECT * FROM students;

-- DELETE FROM courses
-- WHERE course_id NOT IN (SELECT distinct course_id FROM enrollments);
-- 
-- SELECT * FROM courses;

DELETE FROM students WHERE student_id = 3;

SELECT * FROM students;


