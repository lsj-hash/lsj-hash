-- ===========================================================
-- 1. JOIN 문제 (J1 ~ J10)
-- ===========================================================

use employees;

-- ----------------------------------------------------------
-- J1. 직원의 이름과 현재 소속 부서명
-- 테이블: employees.employees, departments
-- ----------------------------------------------------------
SELECT  e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_emp as de ON e.emp_no = de.emp_no 
JOIN departments as d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01'
ORDER BY e.emp_no;


-- ----------------------------------------------------------
-- J2. 현재 부서 관리자 정보
-- 테이블: employees.employees, departments,dept_manager
-- ----------------------------------------------------------
SELECT e.first_name, e.last_name, d.dept_name
FROM employees as e
JOIN dept_manager as ma ON e.emp_no = ma.emp_no 
JOIN departments as d ON ma.dept_no = d.dept_no
WHERE ma.to_date = '9999-01-01'
ORDER BY e.emp_no;


-- ----------------------------------------------------------
-- J3. 직원의 현재 직급과 현재 급여
-- 테이블: employees.employees, titles, salaries
-- ----------------------------------------------------------
SELECT e.first_name, e.last_name, t.title, s.salary
FROM employees as e
JOIN titles as t ON e.emp_no = t.emp_no
JOIN salaries as s ON e.emp_no = s.emp_no
where t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'

-- ----------------------------------------------------------
-- J4. 부서별 평균 급여 (60,000 이상인 부서만)
-- 테이블: employees.salaries, departments
-- ----------------------------------------------------------
SELECT d.dept_name, AVG(s.salary)
FROM dept_emp as em
JOIN departments as d ON em.dept_no = d.dept_no
JOIN salaries as s ON em.emp_no = s.emp_no 
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_name
HAVING AVG(s.salary) >= 60000;


-- ----------------------------------------------------------
-- J5. 'Sales' 부서에 속한 현재 직원 목록
-- 테이블: employees.employees, departments
-- ----------------------------------------------------------
SELECT e.first_name, e.last_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dept_no = d.dept_no
WHERE de.to_date = '9999-01-01' AND d.dept_name = 'Sales';


-- ----------------------------------------------------------
-- J6. 같은 부서에 속한 직원 
-- 테이블: employees.employees, departments
-- ----------------------------------------------------------
SELECT e.first_name, e.last_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dept_no = d.dept_no
WHERE d.dept_name like '%staff%';


-- ----------------------------------------------------------
-- J7. 관리자별 담당 부서 직원 수
-- 테이블: employees.dept_manager, employees, departments
-- ----------------------------------------------------------
SELECT e.first_name, e.last_name, d.dept_name, COUNT(*)
FROM dept_manager AS ma
JOIN employees AS e ON ma.emp_no = e.emp_no
JOIN departments AS d ON ma.dept_no = d.dept_no
JOIN dept_emp AS em ON d.dept_no = em.dept_no 
GROUP BY d.dept_name, e.first_name, e.last_name;


-- ----------------------------------------------------------
-- J8. 직급 변경 이력이 있는 직원
-- 테이블: employees.employees, titles
-- ----------------------------------------------------------
SELECT e.emp_no, e.first_name, t.title, t.from_date
FROM employees AS e
JOIN titles AS t ON e.emp_no = t.emp_no;


-- ----------------------------------------------------------
-- J9. 같은 급여를 받는 직원 
-- 테이블: employees.salaries, employees
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- J10. 직원별 최근 급여 이력만 조회
-- 테이블: employees.employees, salaries
-- ----------------------------------------------------------
SELECT e.emp_no, e.first_name, s.salary, s.from_date
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
order BY s.to_date DESC
LIMIT 10;