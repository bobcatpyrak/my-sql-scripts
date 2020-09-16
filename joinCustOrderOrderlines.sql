select * from customers c
	join orders o on c.id = o.customerid
		join orderlines ol on o.id = ol.ordersid
        
order by c.name asc;