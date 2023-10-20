--Question 1
CREATE OR REPLACE PROCEDURE add_film(title VARCHAR, description VARCHAR, release_year INTEGER, language_id INTEGER, rental_duration INTEGER, rental_rate INTEGER, "length" INTEGER, replace_cost INTEGER, rating VARCHAR(10))
LANGUAGE plpgsql
AS $$
BEGIN 
	INSERT INTO film(title , description , release_year , language_id , rental_duration , rental_rate , "length" , replace_cost )
	VALUES(title , description , release_year , language_id , rental_duration , rental_rate , "length" , replace_cost , rating );
END;
$$;

--Question 2
CREATE OR REPLACE FUNCTION category_film_count(category_id INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
BEGIN  
	SELECT count(fc.category_id)
	FROM film_category fc
	JOIN category c
	ON fc.category_id = c.category_id 
	GROUP BY category."name" ; 
END;
$$;


SELECT category_film_count(1);

SELECT *
FROM category c ;