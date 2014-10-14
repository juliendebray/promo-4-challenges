# Encoding: utf-8
require "csv"

def most_successfull(number, max_year, file_name)
  # TODO: return the number most successfull movies max_year
  csv_options = { col_sep: ',', quote_char: '"' }

  movies = []

  CSV.foreach(file_name, csv_options) do |row|
    movies <<  { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
  end

  movies.select! { |movie| movie[:year] < max_year }

  movies.sort! { |mov_a, mov_b| mov_b[:earnings] <=> mov_a[:earnings] }

  return movies.take(number)
end

p most_successfull(3, 1975, "lib/movies.csv")