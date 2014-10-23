require 'sqlite3'

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  tab = db.execute("SELECT COUNT(*) FROM #{table_name};")
  tab[0][0]
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  tab = db.execute("SELECT name FROM artists
                    ORDER BY name ASC;")
  tab.flatten
end

def love_tracks(db)
  # TODO: return array of love songs
  tab = db.execute("SELECT name FROM tracks
                   WHERE name LIKE '%love%';")
  tab.flatten
end

def long_tracks(db, min_length)
  # TODO: return tracks verifying: duration > min_length (minutes)
  tab = db.execute("SELECT name FROM tracks
                    WHERE milliseconds > #{min_length * 60000};")
  tab.flatten
end