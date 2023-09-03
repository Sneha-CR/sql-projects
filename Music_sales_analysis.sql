--I am having a database of a music store which includes multiple tables which are inter related 
--using this data i have analysed according to need of the company

--transorming of data 
--changing the names of column c1, c2, c3 to album_id, title and artist_id

alter table album
rename c1 to album_id;

alter table album
rename c2 to title

alter table album
rename c3 to artist_id

select * from album

delete from album
where title = 'title'

--1. finding the senior most employee based on job title
select * from employee
order by levels desc
limit 1
--so we get the senior employee as 'madan'
--2. Which countries has the most invoices
select * from invoice

alter table invoice 
rename column c1 to invoice_id

alter table invoice 
rename column c2 to customer_id
alter table invoice 
rename column c3 to invoice_date
alter table invoice 
rename column c4 to billing_address
alter table invoice 
rename column c5 to billing_city
alter table invoice 
rename column c6 to billing_state
alter table invoice 
rename column c7 to billing_country
alter table invoice 
rename column c8 to billing_postal_code
alter table invoice 
rename column c9 to total

select * from invoice

delete from invoice
where invoice_id = 'invoice_id'

select count(*) as c, billing_country
from invoice
group by billing_country
order by c desc

--3. Top 3 values of total invoice

select total from invoice
order by total desc
limit 3

--data cleaning part
select * from playlist
alter table playlist
rename c1 to playlist_id;

alter table playlist
rename c2 to name;

select * from playlist_track
alter table playlist_track
rename c1 to playlist_id;

alter table playlist_track
rename c2 to track_id;

select * from track
alter table track
rename c1 to track_id;

alter table track
rename c2 to name;

alter table track
rename c4 to media_type_id;

alter table track
rename c5 to genre_id;

alter table track
rename c6 to composer;

alter table track
rename c7 to milliseconds;

alter table track
rename c8 to bytes;
alter table track
rename c9 to unit_price;
alter table track
rename c3 to album_id;

select * from track

delete from track
where track_id = 'track_id'

select * from media_type

alter table media_type
rename c1 to media_type_id

alter table media_type
rename c2 to name

delete from media_type
where name='name'
select * from invoice_line

alter table invoice_line
rename c1 to 'invoice_line_id'

alter table invoice_line
rename c2 to 'invoice_id'

alter table invoice_line
rename c3 to 'track_id'

alter table invoice_line
rename c4 to 'unit_price'

ALTER TABLE invoice_line
rename c5 to 'quantity'

select * from invoice_line

delete from invoice_line
where invoice_id = 'invoice_id'

select * from genre
alter table genre
rename c1 to genre_id

alter table genre
rename c2 to name

select * from genre
delete from genre
where genre_id = 'genre_id'

--4. which city has the best customers? We would like to throw a promotional music festival in the city we made the most money. write a query 
--return one city that has the highest sum of invoice totals. Return both the city name & sum of all invoice totalsalbum
select sum(total) as invoice_total, billing_city from invoice
group by billing_city
order by invoice_total desc
--the city that has the best customers is praguealbum

--5. who is the best customer? The customer who has spent the most money will be declared the best customer. Write a query that returns the 
--best customer. Write a query that returns the person who has spent the most moneyalbum
select customer.customer_id, customer.first_name, customer.last_name, sum(invoice.total) as total
from customer
join invoice
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total DESC
limit 1
-- Frantisek is the best customer

--6. write a query to return the email, first name, last name and genre of all rock music listeners. Return your list ordered alphabeticallyal
--by email starting with A
select distinct customer.email, customer.first_name, customer.last_name
from customer
join invoice 
on customer.customer_id = invoice.customer_id
join invoice_line
on invoice.invoice_id  = invoice_line.invoice_id
where track_id in (
  select track_id from track
  join genre 
  on track.genre_id = genre.genre_id
  where genre.name = 'Rock'
  )
  order by email

--7. lets invite the artists who have written the most rock music in our dataset. write a query that returns the artist name and total track count 
--of the top 10 rock bands

select artist.artist_id, artist.name, count(artist.artist_id) as number_of_songs
from track
join album
on album.album_id = track.album_id
join artist 
on artist.artist_id = album.artist_id
join genre 
on genre.genre_id = track.genre_id
where genre.name like 'Rock'
group by artist.artist_id
order by number_of_songs DESC
limit 10

--8. return all the trck name that have a song length longer than the average song length. Return the name and milliseconds for each track. Order 
--by the song length with the longest songs listed first
select name, milliseconds
from track
where milliseconds > 393599
order by milliseconds desc









