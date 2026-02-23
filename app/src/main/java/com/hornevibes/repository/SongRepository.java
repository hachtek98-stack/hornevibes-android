package com.hornevibes.repository;

import com.hornevibes.models.Song;
import com.hornevibes.dao.SongDao;
import java.util.List;

public class SongRepository {
    private SongDao songDao;

    public SongRepository(SongDao songDao) {
        this.songDao = songDao;
    }

    public void insertSong(Song song) {
        songDao.addSong(song);
    }

    public void insertSongs(List<Song> songs) {
        for (Song song : songs) {
            songDao.addSong(song);
        }
    }

    public void updateSong(Song song) {
        songDao.updateSong(song);
    }

    public void deleteSong(int songId) {
        Song song = songDao.getSongById(songId);
        if (song != null) {
            songDao.deleteSong(songId);
        }
    }

    public List<Song> getAllSongs() {
        return songDao.getAllSongs();
    }

    public List<Song> getSongsByArtist(String artist) {
        return songDao.getSongsByArtist(artist);
    }

    public List<Song> getSongsByGenre(String genre) {
        return songDao.getSongsByGenre(genre);
    }

    public Song getSongById(int songId) {
        return songDao.getSongById(songId);
    }
}