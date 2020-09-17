/*select * from instructor i
	join class c on i.id = c.instructorID;*/

select * from student s
	join studentClassRel scr on scr.studentId = s.ID
    join class c on c.ID = scr.classID;

