package com.hornevibes.dao;

import com.hornevibes.model.Song;
import java.util.List;

public interface SongDao {
    // Create a new song
    void addSong(Song song);

    // Read a song by its ID
    Song getSongById(int id);

    // Update an existing song
    void updateSong(Song song);

    // Delete a song by its ID
    void deleteSong(int id);

    // Query all songs
    List<Song> getAllSongs();

    // Query songs by artist
    List<Song> getSongsByArtist(String artist);

    // Query songs by genre
    List<Song> getSongsByGenre(String genre);
}