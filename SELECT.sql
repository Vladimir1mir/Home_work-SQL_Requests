--Название и продолжительность самого длительного трека
SELECT title, duration
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks)

--Название треков, продолжительность которых не менее 3,5 минут
SELECT title
FROM Tracks
WHERE duration >= '00:03:30'

--Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT title
FROM Compilations
WHERE realese_year BETWEEN 2018 AND 2020

--Исполнители, чьё имя состоит из одного слова
SELECT name
FROM Artists
WHERE name NOT LIKE '% %'

--Название треков, которые содержат слово «мой» или «my»
SELECT title
FROM Tracks
WHERE LOWER(title) LIKE LOWER('%my%') or LOWER(title) LIKE LOWER('%мой%')


--Количество исполнителей в каждом жанре
SELECT title, COUNT (DISTINCT ArtistGenres.artist_id)
FROM Genres
LEFT JOIN ArtistGenres ON Genres.id = ArtistGenres.genre_id
GROUP BY title

--Количество треков, вошедших в альбомы 2019–2020 годов
SELECT COUNT(Tracks.id)
FROM Tracks
INNER JOIN Albums ON Tracks.album_id = Albums.id
WHERE Albums.release_year BETWEEN 2019 AND 2020

--Средняя продолжительность треков по каждому альбому
SELECT Albums.title, AVG(Tracks.duration)
FROM Tracks
INNER JOIN Albums ON Tracks.album_id = Albums.id
GROUP BY Albums.title

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT Artists.name
FROM Artists
WHERE Artists.id NOT IN (
SELECT DISTINCT AlbumArtists.artist_id
FROM albums
INNER JOIN albumArtists ON Albums.id = AlbumArtists.album_id
WHERE Albums.release_year = 2020
)

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT Compilations.title
FROM Compilations
INNER JOIN CompilationTracks ON Compilations.id = CompilationTracks.compilation_id
INNER JOIN Artists ON CompilationTracks.artist_id = Artists.id
WHERE Artists.name = 'Linkin Park'
