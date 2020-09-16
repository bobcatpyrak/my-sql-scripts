select City, State, sum(sales) "Total Sales" from customers
	where state = "OH"
	group by city
    -- having city in("Cincinnati", "Columbus")
	having sum(sales) > 600000;