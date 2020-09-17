use eddb;

select concat(s.firstName, " ", s.lastName) as "Name", "A" as "Grade", s.SAT 
from student s
	where s.SAT > 1200
    -- order by s.lastName
union
select concat(s.firstName, " ", s.lastName) as "Name", "B" as "Grade", s.SAT 
from student s
	where s.SAT <= 1200 and s.SAT >= 1000
    -- order by s.lastName
union
select concat(s.firstName, " ", s.lastName) as "Name", "C" as "Grade", s.SAT 
from student s
	where s.SAT < 1000
    -- order by s.lastName;
-- order by lastName; -- this doesn't work
