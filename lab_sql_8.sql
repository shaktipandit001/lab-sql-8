###Rank films by length (filter out the rows with nulls or zeros in length column). 
#Select only columns title, length and rank in your output.
Use sakila;
select * from film;

select *, 
rank() over(order by length desc) as "rank"  
from sakila.film;

select title, length,
rank() over(order by length asc) as "rank"
from film  
where length > 0;

##Rank films by length within the rating category 
#(filter out the rows with nulls or zeros in length column). 
#In your output, only select the columns title, length, rating and rank.

select *, 
rank() over(order by rating desc) as "rank"  
from sakila.film;

select title, length, rating,
rank() over(order by rating asc) as "rank"
from film  
where length > 0;

##How many films are there for each of the categories in the category table? 
#Hint: Use appropriate join between the tables "category" and "film_category".
select * from film_category;
select * from category;
select c.name, count(f.film_id) number
from category c 
join film_category f
on c.category_id = f.category_id
group by c.name ;

##Which actor has appeared in the most films? Hint:
#You can create a join between the tables "actor" and "film actor" 
#and count the number of times an actor appears.
select * from actor;
select * from film_actor;
select a.first_name , count(f.film_id) Appeared_Number
from actor a 
join film_actor f
on a.actor_id= f.actor_id
group by a.first_name;


##Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).film
#count the rented film
##This query might require using more than one join statement. Give it a try. 
#We will talk about queries with multiple join statements later in the lessons.
#Hint: You can use join between three tables - 
#"Film", "Inventory", and "Rental" and count the rental ids for each film.

select * from film;
select * from inventory;
select * from rental;
select f.title, count(r.rental_id) Appeared_Number
from film f
join inventory i
on i.film_id = f.film_id 
join rental r 
on r.inventory_id = i.inventory_id
group by f.title 
order by Appeared_Number desc limit 1;

## I got the result 
#'BUCKET BROTHERHOOD', '34'#





