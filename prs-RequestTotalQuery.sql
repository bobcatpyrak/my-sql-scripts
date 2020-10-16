use prs;

/*
select r.Description, r.DeliveryMode, r.Status, r.Total,
		p.Name, p.Price, li.Quantity, (p.Price * li.Quantity) as 'Subtotal', concat(u.FirstName, " ", u.LastName) as 'Name', u.PhoneNumber
*/
select r.description, sum(li.quantity * p.Price) as 'Total'
	from Request r
	join LineItem li on li.RequestID = r.ID
	join Product p on p.ID = li.ProductID
    join Vendor v on v.ID = p.VendorID
    join User u on u.ID = r.UserID
    group by r.description;