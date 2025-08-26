-- Создание таблиц базы данных музыкального сервиса

CREATE TABLE IF NOT EXISTS Genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration INT NOT NULL CHECK (duration > 0), -- в секундах
    album_id INT NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL CHECK (release_year > 1900)
);

-- Связь многие-ко-многим: исполнители и жанры
CREATE TABLE IF NOT EXISTS ArtistGenres (
    artist_id INT REFERENCES Artists(id),
    genre_id INT REFERENCES Genres(id),
    PRIMARY KEY (artist_id, genre_id)
);

-- Связь многие-ко-многим: исполнители и альбомы
CREATE TABLE IF NOT EXISTS ArtistAlbums (
    artist_id INT REFERENCES Artists(id),
    album_id INT REFERENCES Albums(id),
    PRIMARY KEY (artist_id, album_id)
);

-- Связь многие-ко-многим: сборники и треки
CREATE TABLE IF NOT EXISTS CollectionTracks (
    collection_id INT REFERENCES Collections(id),
    track_id INT REFERENCES Tracks(id),
    PRIMARY KEY (collection_id, track_id)
);