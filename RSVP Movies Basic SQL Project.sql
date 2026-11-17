create database movies;
use movies;

create table Movies(
Movie_id int primary key,
Title varchar(100),
Release_year year,
Genre varchar(50),
Language varchar(20),
Budget decimal(10,2),
Revenue decimal(10,2)
);

create table Directors(
Director_id int primary key,
name varchar(100)
);

create table Movie_director(
Movie_id int,
Director_id int,
foreign key (movie_id) references Movies(movie_id),
foreign key (director_id) references directors(director_id)
);

create table ratings(
Movie_id int,
Rating decimal(3,1),
foreign key (movie_id) references movies(movie_id)
);

-- Insert Movies
INSERT INTO Movies VALUES
(1, 'Uri: The Surgical Strike', 2019, 'Action', 'Hindi', 25.00,
350.00),
(2, 'Kedarnath', 2018, 'Romance', 'Hindi', 40.00, 100.00),
(3, 'Love Per Square Foot', 2018, 'Comedy', 'Hindi', 20.00, 45.00);
-- Insert Directors
INSERT INTO Directors VALUES
(1, 'Aditya Dhar'),
(2, 'Abhishek Kapoor'),
(3, 'Anand Tiwari');
-- Insert Movie_Director
INSERT INTO Movie_Director VALUES
(1, 1),

(2, 2),
(3, 3);
-- Insert Ratings
INSERT INTO Ratings VALUES
(1, 8.3),
(2, 6.9),
(3, 7.3);



INSERT INTO Movies VALUES
(1, 'Uri: The Surgical Strike', 2019, 'Action', 'Hindi', 25.00,
350.00),
(2, 'Kedarnath', 2018, 'Romance', 'Hindi', 40.00, 100.00),
(3, 'Love Per Square Foot', 2018, 'Comedy', 'Hindi', 20.00, 45.00);

INSERT INTO Directors VALUES
(1, 'Aditya Dhar'),
(2, 'Abhishek Kapoor'),
(3, 'Anand Tiwari');

INSERT INTO Movie_Director VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Ratings VALUES
(1, 8.3),
(2, 6.9),
(3, 7.3);

-- list all movies released after 2017
select * from movies
where release_year > 2017;

-- find the highest revenue movie 
select * from movies
order by revenue desc
limit 1;

-- show movies with rating > 7 
select m.title, r.rating
from movies m
join ratings r on m.movie_id = r.movie_id
where r.rating > 7;

-- get directors and their movies
select d.name as Director, m.title as Movie
from directors d
join movie_director md on d.director_id = md.director_id
join movies m on md.movie_id = m.movie_id;

-- calculate profit = revenue - budget  
select title, (revenue - budget) as Profit
from movies;

-- find average rating per genre
select m.genre, avg(rating) as avg_rating
from movies m
join ratings r on m.movie_id = r.movie_id
group by m.genre;

-- recommend top 3 movies by rating
select m.title, r.rating
from movies m
join ratings r on m.movie_id = r.movie_id
limit 3;




