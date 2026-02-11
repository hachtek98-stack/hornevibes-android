-- Sample test data for HorneVibes database

-- Users
INSERT INTO users (id, username, password, email) VALUES
(1, 'user1', 'password1', 'user1@example.com'),
(2, 'user2', 'password2', 'user2@example.com'),
(3, 'user3', 'password3', 'user3@example.com');

-- Artists
INSERT INTO artists (id, name) VALUES
(1, 'Artist A'),
(2, 'Artist B'),
(3, 'Artist C');

-- Albums
INSERT INTO albums (id, title, artist_id, release_year) VALUES
(1, 'Album One', 1, 2021),
(2, 'Album Two', 2, 2020),
(3, 'Album Three', 3, 2019);

-- Songs
INSERT INTO songs (id, title, album_id, duration) VALUES
(1, 'Song One', 1, '3:45'),
(2, 'Song Two', 1, '4:00'),
(3, 'Song Three', 2, '2:30'),
(4, 'Song Four', 3, '5:15');

-- Genres
INSERT INTO genres (id, name) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'Jazz');

-- Playlists
INSERT INTO playlists (id, user_id, title) VALUES
(1, 1, 'My Favorite Songs'),
(2, 2, 'Chill Vibes'),
(3, 3, 'Workout Playlist');

-- Playlist Songs
INSERT INTO playlist_songs (playlist_id, song_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(3, 4);