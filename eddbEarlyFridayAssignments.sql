-- list of students and their majors, but only students with a major declared
/*
select concat(s.firstName, " ", s.lastName) as "Name", m.* 
	from student s
		left join major m on m.ID = s.majorID
        order by s.majorID desc;*/
        
        -- list all classes and instructors assigned to them
/*
select *
	from instructor i
    left join class c on i.ID = c.InstructorId
    order by c.id;*/
    
    -- list all instructors, and the classes they are teaching if they teach classes ^
    
    -- list all students, and classes they're enrolled in
    /*
    select *
		from student s
        join studentclassrel scr on scr.StudentId = s.id
        join class c on c.id = scr.ClassId;
   */ 
   -- All classes a major requires
	/*select *
		from major m
        join majorclassrel mcr on mcr.majorId = m.id
        join class c on c.id = mcr.ClassId
        order by c.ID*/
        
	-- for each major, how many classes are required
    select m.Description as "Major", count(*) as "Amount of Classes Required"
            from major m
            join majorclassrel mcr on mcr.majorid = m.id
            group by m.description
				having count(*) > 10
            order by m.description
            