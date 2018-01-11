--문제1
select first_name || ' ' || last_name  이름,
        salary 월급,
        phone_number 전화번호,
        hire_date 입사일
from employees
order by hire_date;

--문제2
select job_title,
        max_salary
from jobs
order by max_salary desc;

--문제3
select first_name,
        manager_id,
        commission_pct,
        salary
from EMPLOYEES
where manager_id is not null
   and commission_pct is null
   and salary > 3000;
   
/*
문제4.
최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을
최고월급의(salary) 내림차순(DESC)로 정렬하여 출력하세요.
*/
select job_title,
        max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;

/*
문제5.
월급이 14000 미만 10000 이상인 직원의 이름(first_name), 월급, 커미션퍼센트 를
월급순(내림차순) 출력하세오. 단 커미션퍼센트 가 null 이면 0 으로 나타내시오
*/
select first_name,
        salary,
        nvl(commission_pct,0)
from employees
where salary < 14000
  and salary >=10000
order by salary desc;

/*
문제6.
부서번호가 10, 90, 100 인 직원의 이름, 월급, 입사일, 부서번호를 나타내시오
입사일은 1977-12 와 같이 표시하시오
*/
select first_name,
        salary,
        to_char(hire_date,'yyyy-mm'),
        department_id
from employees
where department_id
   in(10,90,100);

/*
문제7.
이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 월급을 나타내시오
*/
select first_name,
        salary
from employees
where first_name
 like '%S%'
 or first_name
 like '%s%';
   
/*
문제8.
전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세오.
*/
select *
from departments
order by LENGTH(department_name) desc;


/*
문제9.
정확하지 않지만, 지사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
올림차순(ASC)으로 정렬해 보세오.
*/
select upper(country_name)
from countries
order by country_name;

/*
문제10.
입사일이 03/12/31 일 이전 입사한 직원의 이름, 월급, 전화 번호, 입사일을 출력하세요
전화번호는 545-343- 3433 과 같은 형태로 출력하시오.
*/
select first_name,
        salary,
        REPLACE(phone_number,'.','-'),
        hire_date
from employees
where hire_date < '03/12/31';