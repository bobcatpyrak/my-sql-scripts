select sum(price) "Total Cost", o.*, c.* from orderLines ol
	
    join orders o on o.id = ol.ordersID
    join customers c on c.id = o.customerID
    group by (ordersID);