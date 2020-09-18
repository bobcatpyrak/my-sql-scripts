insert Student 
	(ID, firstName, lastName, SAT, GPA, MajorID)
    values
    (0, 'Jim', 'Gordon', 875, 2.70, (select m.id from major m where m.description = "Math"));
   
select * from student
		where firstName = "Jim";