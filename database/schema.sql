CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    role ENUM('admin', 'user') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE songs (
    song_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT,
    genre_id INT,
    length INT,
    release_date DATE,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id)
);

CREATE TABLE artists (
    artist_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
    album_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist_id INT NOT NULL,
    release_date DATE,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE playlists (
    playlist_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE favorites (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE listening_history (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    listened_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, song_id, listened_at),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

-- Optimized Indexing
CREATE INDEX idx_user_id ON favorites(user_id);
CREATE INDEX idx_song_id ON favorites(song_id);

-- RLS Policies
CREATE POLICY user_access ON songs
    FOR SELECT
    USING (user_id = current_setting('app.current_user_id')::INT);

CREATE POLICY admin_access ON songs
    FOR ALL
    USING (current_setting('app.current_user_role') = 'admin');