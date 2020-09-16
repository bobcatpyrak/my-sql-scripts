use eddb;

select * from student
	where gpa >= 3 and gpa <= 3.25
	order by gpa desc;
