use eddb;

set @funds = 5000;
set @sat = 1200;

select *
	from student
		where SAT >= @sat
        Order By SAT desc, lastName asc;
