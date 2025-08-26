-- ЗАДАНИЕ 2

-- 1. Название и продолжительность самого длительного трека
SELECT title, duration 
FROM Tracks 
ORDER BY duration DESC 
LIMIT 1;

-- 2. Название треков, продолжительность которых не менее 3,5 минут (210 секунд)
SELECT title 
FROM Tracks 
WHERE duration >= 210;

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title 
FROM Collections 
WHERE release_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name 
FROM Artists 
WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my» (без учёта регистра)
SELECT title 
FROM Tracks 
WHERE LOWER(title) LIKE '%my%' OR LOWER(title) LIKE '%мой%';


-- ЗАДАНИЕ 3

-- 1. Количество исполнителей в каждом жанре
SELECT g.name AS genre, COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.id = ag.genre_id
GROUP BY g.id, g.name;

-- 2. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM Tracks t
JOIN Albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a.title AS album, AVG(t.duration) AS avg_duration_seconds
FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.id, a.title;

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT DISTINCT ar.name
FROM Artists ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM ArtistAlbums aa
    JOIN Albums al ON aa.album_id = al.id
    WHERE al.release_year = 2020
);

-- 5. Названия сборников, в которых присутствует конкретный исполнитель (например, Queen)
SELECT DISTINCT c.title
FROM Collections c
JOIN CollectionTracks ct ON c.id = ct.collection_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN ArtistAlbums aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Queen';


-- ЗАДАНИЕ 4 

-- 1. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title
FROM Albums a
JOIN ArtistAlbums aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.id IN (
    SELECT ag.artist_id
    FROM ArtistGenres ag
    GROUP BY ag.artist_id
    HAVING COUNT(ag.genre_id) > 1
);

-- 2. Наименования треков, которые не входят в сборники
SELECT t.title
FROM Tracks t
LEFT JOIN CollectionTracks ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

-- 3. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
WITH shortest AS (
    SELECT MIN(duration) AS min_duration FROM Tracks
)
SELECT DISTINCT ar.name
FROM Artists ar
JOIN ArtistAlbums aa ON ar.id = aa.artist_id
JOIN Tracks t ON aa.album_id = t.album_id
CROSS JOIN shortest
WHERE t.duration = shortest.min_duration;

-- 4. Названия альбомов, содержащих наименьшее количество треков
WITH track_counts AS (
    SELECT album_id, COUNT(*) AS cnt
    FROM Tracks
    GROUP BY album_id
),
min_count AS (
    SELECT MIN(cnt) AS min_cnt FROM track_counts
)
SELECT a.title
FROM Albums a
JOIN track_counts tc ON a.id = tc.album_id
CROSS JOIN min_count
WHERE tc.cnt = min_count.min_cnt;