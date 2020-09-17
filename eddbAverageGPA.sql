use eddb;

select *, (select avg(sat) from student) as "AVG SAT" from student 
	where SAT < (select avg(sat) from student)
	order by lastName; 