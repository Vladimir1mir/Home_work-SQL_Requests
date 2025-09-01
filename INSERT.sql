INSERT INTO Artists (id, name) VALUES
(1, 'Linkin Park'),
(2, 'Nirvana'),
(3, 'Lady Gaga'),
(4, 'Eminem'),
(5, 'Drake');

INSERT INTO Genres (id, title) VALUES
(1, 'Rock'),
(2, 'Pop'),
(3, 'Rap');

INSERT INTO Albums (id, title, release_year) VALUES
(1, 'Meteora', 2003),
(2, 'Nevermind', 1991),
(3, 'The Fame', 2008),
(4, 'Recovery', 2009),
(5, 'Chromatica', 2020),
(6, 'Hybrid Theory', 2000);

INSERT INTO Tracks (id, title, duration, album_id) VALUES
(1, 'Somewhere I Belong', '00:03:34', 1),
(2, 'From the inside', '00:02:56', 1),
(3, 'Smells Like Teen Spirit', '00:05:01', 2),
(4, 'Paparazzi', '00:03:28', 3),
(5, 'Poker Face', '00:03:57', 3),
(6, 'Not Afraid', '00:04:08', 4),
(7, 'My December', '00:04:20', 6),
(8, 'Crawling', '00:03:29', 6),
(9, 'Stupid Love', '00:03:13', 5),
(10, 'Alice', '00:02:57', 5);

INSERT INTO Compilations (id, title, realese_year) VALUES
(1, 'Compilation 1', 2000),
(2, 'Compilation 2', 2010),
(3, 'Compilation 3', 2020),
(4, 'Compilation 4', 2021);

INSERT INTO ArtistGenres (artist_id, genre_id) VALUES
(1, 1), -- Linkin Park — Rock
(1, 2), -- Linkin Park — Pop (чтобы был в двух жанрах)
(2, 1), -- Nirvana — Rock
(3, 2), -- Lady Gaga — Pop
(4, 3), -- Eminem — Rap
(5, 3); -- Drake — Rap

INSERT INTO AlbumArtists (album_id, artist_id) VALUES
(1, 1), -- Meteora — Linkin Park
(2, 2), -- Nevermind — Nirvana
(3, 3), -- The Fame — Lady Gaga
(4, 4), -- Recovery — Eminem
(5, 3), -- Chromatica — Lady Gaga
(6, 1); -- Hybrid Theory — Linkin Park

INSERT INTO CompilationTracks (compilation_id, track_id) VALUES
(1, 1), -- Compilation 1 — Somewhere I Belong
(1, 8), -- Compilation 1 — Crawling
(2, 3), -- Compilation 2 — Smells Like Teen Spirit
(3, 9), -- Compilation 3 — Stupid Love
(4, 5); -- Compilation 4 — Poker Face
