use eddb;
-- select * from student s
-- 	join major m on s.majorID = m.ID;
	-- where sat < 1000;
    /*
select Firstname, Lastname, YearsExperience from instructor i
	order by Lastname;*/
    
/*   select m.description, c.Section, c.Subject from major m
		join majorClassRel mcr on m.ID = mcr.MajorId
        join Class c on c.ID = mcr.ClassID
        where m.description = "General Business";*/
        /*
	select * from student s
		left join major m on m.id = s.MajorId*/
        
	select c.*, concat(i.firstname, " ", i.lastname) as Name from class c
		left join instructor i on c.InstructorId = i.id;
        