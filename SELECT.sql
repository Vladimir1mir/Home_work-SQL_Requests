-- 1. Название и продолжительность самого длительного трека
SELECT title, duration
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);

-- 2. Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM Tracks
WHERE duration >= '00:03:30';

-- 3. Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM Compilations
WHERE realese_year BETWEEN 2018 AND 2020;

-- 4. Исполнители, чьё имя состоит из одного слова
SELECT name
FROM Artists
WHERE name NOT LIKE '% %';

-- 5. Название треков, которые содержат слово «мой» или «my»
SELECT title
FROM Tracks
WHERE LOWER(title) LIKE '%my%' OR LOWER(title) LIKE '%мой%';

-- 6. Количество исполнителей в каждом жанре
SELECT g.title, COUNT(ag.artist_id) AS artist_count
FROM Genres g
LEFT JOIN ArtistGenres ag ON g.id = ag.genre_id
GROUP BY g.id, g.title;

-- 7. Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(t.id) AS track_count
FROM Tracks t
INNER JOIN Albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

-- 8. Средняя продолжительность треков по каждому альбому
SELECT a.title, AVG(t.duration) AS avg_duration
FROM Tracks t
INNER JOIN Albums a ON t.album_id = a.id
GROUP BY a.id, a.title;

-- 9. Все исполнители, которые не выпустили альбомы в 2020 году
SELECT ar.name
FROM Artists ar
WHERE ar.id NOT IN (
    SELECT DISTINCT aa.artist_id
    FROM AlbumArtists aa
    INNER JOIN Albums al ON aa.album_id = al.id
    WHERE al.release_year = 2020
);

-- 10. Названия сборников, в которых присутствует конкретный исполнитель (Linkin Park)
SELECT DISTINCT c.title
FROM Compilations c
JOIN CompilationTracks ct ON c.id = ct.compilation_id
JOIN Tracks t ON ct.track_id = t.id
JOIN Albums a ON t.album_id = a.id
JOIN AlbumArtists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Linkin Park';

-- 11. Названия альбомов, в которых присутствуют исполнители более чем одного жанра
SELECT DISTINCT a.title
FROM Albums a
JOIN AlbumArtists aa ON a.id = aa.album_id
JOIN Artists ar ON aa.artist_id = ar.id
JOIN ArtistGenres ag ON ar.id = ag.artist_id
GROUP BY a.id, a.title
HAVING COUNT(DISTINCT ag.genre_id) > 1;

-- 12. Наименования треков, которые не входят в сборники
SELECT t.title
FROM Tracks t
LEFT JOIN CompilationTracks ct ON t.id = ct.track_id
WHERE ct.track_id IS NULL;

-- 13. Исполнитель или исполнители, написавшие самый короткий по продолжительности трек
SELECT DISTINCT ar.name
FROM Artists ar
JOIN AlbumArtists aa ON ar.id = aa.artist_id
JOIN Albums a ON aa.album_id = a.id
JOIN Tracks t ON a.id = t.album_id
WHERE t.duration = (SELECT MIN(duration) FROM Tracks);

-- 14. Названия альбомов, содержащих наименьшее количество треков
SELECT a.title
FROM Albums a
JOIN Tracks t ON a.id = t.album_id
GROUP BY a.id, a.title
HAVING COUNT(t.id) = (
    SELECT MIN(track_count)
    FROM (
        SELECT COUNT(t2.id) AS track_count
        FROM Albums a2
        LEFT JOIN Tracks t2 ON a2.id = t2.album_id
        GROUP BY a2.id
    ) AS counts
);
