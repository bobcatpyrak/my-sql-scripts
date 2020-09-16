select s.ID, concat(s.Firstname, ' ', s.LastName) Name, s.GPA, m.description 'Qualified Major'
	from student s
    join major m on s.sat >= m.minsat;