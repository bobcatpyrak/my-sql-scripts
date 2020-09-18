/*update student
	set SAT = (SAT+100)
    where id = 191;
    
update student
	set SAT = 950, GPA = 2.2
    where id = 140;
    
select * from student
	where sat >= 1000 and sat <= 1300;*/
    

/*
update student set
	gpa = gpa+0.1
    where (sat >= 1000 and sat <= 1300);
  --  select * from student where lastname = "Gould"
update student set
	majorID = (select id from major where description = "Accounting"),
    gpa = 2.61
    where id = 110;*/
    
-- select * from student
delete from student
	where id=191;

