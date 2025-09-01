CREATE TABLE IF NOT EXISTS Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL CHECK (release_year >= 1900)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    duration INTERVAL NOT NULL CHECK (duration > INTERVAL '0 seconds'),
    album_id INT NOT NULL REFERENCES Albums(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    realese_year INT NOT NULL CHECK (realese_year >= 1900)
);

CREATE TABLE IF NOT EXISTS ArtistGenres (
    artist_id INT NOT NULL REFERENCES Artists(id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES Genres(id) ON DELETE CASCADE,
    PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS AlbumArtists (
    album_id INT NOT NULL REFERENCES Albums(id) ON DELETE CASCADE,
    artist_id INT NOT NULL REFERENCES Artists(id) ON DELETE CASCADE,
    PRIMARY KEY (album_id, artist_id)
);

CREATE TABLE IF NOT EXISTS CompilationTracks (
    compilation_id INT NOT NULL REFERENCES Compilations(id) ON DELETE CASCADE,
    track_id INT NOT NULL REFERENCES Tracks(id) ON DELETE CASCADE,
    PRIMARY KEY (compilation_id, track_id)
);
