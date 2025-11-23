-- ===========================================================
-- 1. SUBQUERY 문제(S1 ~ S10)
-- ===========================================================

use employees;

-- ----------------------------------------------------------
-- S1. 전체 평균 급여보다 많이 받는 직원
-- 테이블: employees.employees, salaries
-- ----------------------------------------------------------
SELECT e.emp_no, e.first_name, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.salary > (SELECT AVG(salary) FROM salaries);
-- ----------------------------------------------------------
-- S2. 'Sales' 부서에 속한 직원들
-- 테이블: employees.employees, departments
-- ----------------------------------------------------------
SELECT e.emp_no, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS em ON e.emp_no = em.emp_no 
JOIN departments AS d ON em.dept_no = d.dept_no
WHERE  em.to_date = '9999-01-01' AND d.dept_name = 'Sales';

-- ----------------------------------------------------------
-- S3. 급여 기록이 한 번도 없는 직원 
-- 테이블: employees.employees
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- S4. 부서별 평균 급여가 전체 평균보다 높은 부서
-- 테이블: employees.salaries, departments
-- ----------------------------------------------------------
SELECT d.dept_name as '전체 평균보다 높은 부서', AVG(s.salary) as '평균'
FROM dept_emp as em
JOIN departments as d ON em.dept_no = d.dept_no
JOIN salaries as s ON em.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING AVG(s.salary) > (SELECT AVG(salary) FROM salaries);  


-- ----------------------------------------------------------
-- S5. 각 직원의 최대 급여와 현재 급여
-- 테이블: employees.employees, salaries
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- S6. 특정 직원(10001)과 같은 급여를 받는 직원들
-- 테이블: employees.employees, salaries
-- ----------------------------------------------------------
select e.emp_no, e.first_name, e.last_name, s.salary
from employees as e
JOIN salaries as s ON e.emp_no = s.emp_no
WHERE s.salary = 
(SELECT salary FROM salaries WHERE emp_no = 10001 AND to_date = '9999-01-01')
AND s.to_date = '9999-01-01';


-- ----------------------------------------------------------
-- S7. 직급이 'Manager'인 부서의 모든 직원
-- 테이블: employees.employees, titles, departments
-- ----------------------------------------------------------



-- ----------------------------------------------------------
-- S8. 직원 수가 가장 많은 부서 Top 3
-- 테이블: employees.departments
-- ----------------------------------------------------------
SELECT d.dept_name, COUNT(*) as '직원수'
FROM dept_emp as em 
JOIN departments as d ON em.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY COUNT(*) DESC
LIMIT 3;


-- ----------------------------------------------------------
-- S9. 부서 이동 이력이 있는 직원
-- 테이블: employees.employees
-- ----------------------------------------------------------


-- ----------------------------------------------------------
-- S10. 직원 수가 가장 많은 부서에 속한 직원들
-- 테이블: employees.employees, departments
-- ----------------------------------------------------------
