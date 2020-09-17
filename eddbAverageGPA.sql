use eddb;

select * from student 
	where GPA >= (select (sum(GPA) / count(gpa)) from student);