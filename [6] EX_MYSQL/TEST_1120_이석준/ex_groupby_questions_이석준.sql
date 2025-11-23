-- ===========================================================
-- 1. GROUP BY 문제
-- ===========================================================

use employees;

-- ----------------------------------------------------------
-- G1. 성별별 직원 수
-- 테이블: employees.employees
-- ----------------------------------------------------------
select gender, COUNT(*) from employees
GROUP BY gender;    

-- ----------------------------------------------------------
-- G2. 부서별 현재 직원 수
-- 테이블: employees.employees
-- ----------------------------------------------------------
SELECT dept_no '부서', COUNT(*)'부서별 직원수' from dept_emp
GROUP BY dept_no;



-- ----------------------------------------------------------
-- G3.직급별 직원 수 (전체 이력 기준)
-- 테이블: 
-- ----------------------------------------------------------
SELECT title, COUNT(DISTINCT emp_no) AS cnt
FROM titles
GROUP BY title;


-- ----------------------------------------------------------
-- G4. 직급별 “현재” 직원 수
-- 테이블: 
-- ----------------------------------------------------------
SELECT title, COUNT(DISTINCT emp_no) FROM titles
WHERE to_date = '9999-01-01'   
GROUP BY title;



-- ----------------------------------------------------------
-- G5.부서별 평균 급여 (현재 기준)
-- 테이블: employees.title
-- ----------------------------------------------------------
SELECT d.dept_name, AVG(s.salary) as '평균'
FROM dept_emp as em
JOIN departments d ON em.dept_no = d.dept_no
JOIN salaries s ON em.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_name;

-- ----------------------------------------------------------
-- G7.부서별 남녀 인원수
-- 테이블: 
-- ----------------------------------------------------------
-- 현재 재직중인 직원 기준으로 부서별 남녀 인원수 집계
SELECT d.dept_name, e.gender, COUNT(*) 
FROM employees e    
JOIN dept_emp em ON e.emp_no = em.emp_no
JOIN departments d ON em.dept_no = d.dept_no
where em.to_date = '9999-01-01'
GROUP BY d.dept_name, e.gender;

-- ----------------------------------------------------------
-- G8.부서별 평균 재직 일수
-- 테이블: employees.employees
-- ----------------------------------------------------------



-- ----------------------------------------------------------
-- G9.직급별 평균 급여 (현재 직급 + 현재 급여)
-- 테이블: employees.employees
-- ----------------------------------------------------------
SELECT t.title, AVG(s.salary) AS avg_salary
FROM titles AS t
JOIN salaries AS s ON t.emp_no = s.emp_no
WHERE t.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
GROUP BY t.title
ORDER BY avg_salary DESC;