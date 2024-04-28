-- Bookstore SQL Project
select * from books_scraped;
-- 1.Top 10 expensive and cheapest books;
select title as books ,price from books_scraped order by price desc limit 10;
select title as books ,price from books_scraped order by price asc limit 10;
-- 2.Most categories of book present;
select book_category ,count(title) as Count from books_scraped group by book_category order by count(title) desc limit 5;
-- 3.Non-fiction books having rating more than 3;
select title as Title,book_rating as Rating from books_scraped where Book_category="Nonfiction" and book_rating>3;
-- 4.Out of stock books;
select count(title) from books_scraped where stock <>"In stock";
-- 5.Quantity of books according to rating;
select book_rating,count(title) from books_scraped group by book_rating order by book_rating asc;
-- 6. category,rating of books having name "Saga" 
select title,book_category,book_rating from books_scraped where title like "Saga%";
-- 7. Display ,minimum price of books category wise;
select min(price),book_category from books_scraped group by book_category order by min(price) asc ;
-- 8. book categories having avg price greater 40;
 select avg(price) as AVG_Price, book_category from books_scraped group by book_category having avg(price)>40;
 -- 9. Find details of book having 3th highest price ;
select *, row_number() over(order by price desc) as rn from books_scraped;
select * from (select *, row_number() over( order by price desc) as rn from books_scraped) as x where x.rn=3;
-- 10. Details of book having 5th highest price in each category;
select *, row_number() over(partition by book_category order by price desc) as rn from books_scraped;
select * from (select *, row_number() over(partition by book_category order by price desc) as rn from books_scraped) as x where x.rn=3;
-- 11. Displaying price of books as Expensive or Cheap according to a specified criteria;
select title,price,
CASE when price > 45 then "Expensive" when price < 30 then "Cheap" else "Moderate" end as book_status from books_scraped;