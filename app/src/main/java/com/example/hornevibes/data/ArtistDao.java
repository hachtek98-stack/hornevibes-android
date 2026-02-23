public interface ArtistDao {
    void insert(Artist artist);

    void update(Artist artist);

    void delete(Artist artist);

    Artist getArtist(int artistId);

    List<Artist> getAllArtists();
}