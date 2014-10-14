require 'open-uri'
require 'json'
require 'time'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  grid = (1..grid_size).map { ('A'..'Z').to_a[rand(26)] }
  # grid_size.times do
  #   grid << ("A".."Z").to_a.sample
  # end
  return grid
end
# p generate_grid(9)


def translate(attempt)
  # Return the translation of the attempt / return nil if not an english word
  api_url = "http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}"
  translation = {}
  open(api_url) do |stream|
    string = JSON.parse(stream.read)
    if string["term0"].nil?
      translation = nil
    else
      translation = string['term0']['PrincipalTranslations']['0']['FirstTranslation']['term']
    end
  end
  translation
end
# p translate("rien")



def in_the_grid?(attempt, grid)
  # Is the word in the grid? / DO NOT MULTIPLE LETTERS CASE
  letters = attempt.upcase.split("")
  res = letters.all? do |letter|
    grid.include?(letter)
  end
  res
end
# p in_the_grid?("HAAT", ["A","B","H","T"])

def compute_score(attempt, start_time, end_time)
  score = (end_time - start_time) > 60 ? 0 : attempt.size * ((1 - (end_time - start_time) / 60))
  score
end


def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  result = { time: end_time - start_time, score: 0 }
  if in_the_grid?(attempt, grid)
    if translate(attempt).nil?
      result[:translation] = nil
      result[:message] = "not an english word"
    else
      result[:translation] = translate(attempt)
      result[:message] = "well done"
      result[:score] = compute_score(attempt, start_time, end_time)
    end
  else
    result[:translation] = translate(attempt)
    result[:message] = "not in the grid"
  end
  return result
end

# p run_game("HOUSE", %w(H O U S E), 6, 10)
