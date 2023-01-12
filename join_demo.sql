SELECT *
FROM favorite_song;

SELECT *
FROM artist;

-- LEFT TABLE (FROM CLAUSE)
-- RIGHT TABLE (JOIN CLAUSE)

-- INNER JOIN
SELECT *
FROM artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

SELECT *
FROM favorite_song
INNER JOIN artist
ON favorite_song.artist_id = artist.artist_id;

SELECT song_name, album, artist_name
FROM artist
INNER JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

-- LEFT JOIN
SELECT song_name, album, artist_name
FROM artist
LEFT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

SELECT song_name, album, artist_name
FROM artist
RIGHT JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

-- FULL JOIN
SELECT song_name, album, artist_name
FROM artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

-- Be specific with which column header you want from which table
SELECT song_name, album, artist_name, favorite_song.artist_id
FROM artist
FULL JOIN favorite_song
ON favorite_song.artist_id = artist.artist_id;

-- You  can rename/alaiad your tables
SELECT song_name, album, artist_name, f_s.artist_id
FROM artist
FULL JOIN favorite_song AS f_s
ON f_s.artist_id = artist.artist_id;
