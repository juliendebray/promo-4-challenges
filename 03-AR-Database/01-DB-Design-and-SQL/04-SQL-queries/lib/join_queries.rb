require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  return db.execute("SELECT tr.name, alb.title, art.name FROM tracks tr
                    JOIN albums alb ON (tr.album_id = alb.id)
                    JOIN artists art ON (alb.artist_id = art.id);")
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  tab = db.execute("SELECT COUNT(*), AVG(milliseconds) FROM tracks tr
                    JOIN genres g ON tr.genre_id = g.id
                    WHERE g.name = '#{genre_name}';")
  return {
            category: genre_name,
            number_of_songs: tab[0][0],
            avg_length: (tab[0][1] / 60_000).round(2)
          }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 rock artists
  tab = db.execute("SELECT art.name, COUNT(*) as c
                    FROM tracks tr
                    JOIN albums alb ON (tr.album_id = alb.id)
                    JOIN genres g ON (tr.genre_id = g.id)
                    JOIN artists art ON (alb.artist_id = art.id)
                    WHERE g.name = '#{genre_name}'
                    GROUP BY alb.artist_id
                    ORDER BY c DESC
                    ;")
  return tab[0..4]
end