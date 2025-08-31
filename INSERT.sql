INSERT INTO Artists (name)
VALUES
('Linkin Park'),
('Nirvana'),
('Ledy Gaga'),
('Eminem');

INSERT INTO Genres (title)
VALUES
('Rock'),
('Pop'),
('Rap');

INSERT INTO Albums (title, release_year)
VALUES
('Meteora', 2003),
('Nevermind', 1991),
('The Fame', 2008),
('Recovery', 2009);

INSERT INTO Albums (title, release_year)
VALUES
('Chromatica', 2020),
('Hybrid Theory', 2000);


INSERT INTO Tracks (title, duration, album_id)
VALUES
('Somewhere I Belong', '00:03:34', 1),
('From the inside', '00:02:56', 1),
('Smells Like Teen Spirit', '00:05:01', 2),
('Paparazzi', '00:03:28', 3),
('Poker Face', '00:03:57', 3),
('Not Afraid', '00:04:08', 4);

INSERT INTO Tracks (title, duration, album_id)
VALUES
('My December', '00:04:20', 6),
('Crawling', '00:03:29', 6),
('Stupid Love', '00:03:13', 5),
('Alice', '00:02:57', 5);


INSERT INTO Compilations (title, realese_year)
VALUES
('Compilation 1', 2000),
('Compilation 2', 2010),
('Compilation 3', 2020),
('Compilation 4', 2021);

INSERT INTO ArtistGenres (artist_id, genre_id)
VALUES
(3, 1),
(4, 1),
(5, 2),
(6, 3);

INSERT INTO AlbumArtists (album_id, artist_id)
VALUES
(1, 3),
(2, 4),
(3, 5),
(4, 6);

INSERT INTO AlbumArtists (album_id, artist_id)
VALUES
(5, 5),
(3, 6);

INSERT INTO CompilationTracks (compilation_id, artist_id)
VALUES
(1, 3),
(2, 4),
(3, 5),
(4, 6);
