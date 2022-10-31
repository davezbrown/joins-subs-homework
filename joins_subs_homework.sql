
-- Question 1
select customer.first_name, customer.last_name, customer.email, district
from customer
full join address
on customer.address_id = address.address_id
where district = 'Texas';

-- Question 2
select customer.first_name, customer.last_name, amount
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Question 3
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment 
	group by customer_id 
	having sum(amount) > 175
	order by sum(amount) desc
);

-- Question 4
select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

-- Question 5
select count(payment.staff_id), staff.first_name, staff.last_name
from payment
full join staff
on payment.staff_id = staff.staff_id
group by staff.first_name, staff.last_name
order by count(payment.staff_id) desc;

-- Question 6
select rating, count(rating)
from film
group by rating
order by count(rating) desc;

-- Question 7
-- Using join, displaying customer name and amount of the transaction
select first_name, last_name, amount 
from customer
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- Using subquery, displaying the customer name but not the amount of the transaction
select first_name, last_name
from customer
where customer_id in (
	select customer_id
	from payment 
	group by customer_id, payment.amount
	having amount > 6.99
	order by amount desc
);

-- Question 8
select count(rental.rental_id)
from rental
full join payment
on rental.rental_id = payment.rental_id
where payment.amount = 0;