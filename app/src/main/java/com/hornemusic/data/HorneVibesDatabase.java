import androidx.room.Database;
import androidx.room.RoomDatabase;

@Database(entities = {Song.class, Artist.class, Album.class, Playlist.class}, version = 1) 
public abstract class HorneVibesDatabase extends RoomDatabase {
    // Database access methods
}