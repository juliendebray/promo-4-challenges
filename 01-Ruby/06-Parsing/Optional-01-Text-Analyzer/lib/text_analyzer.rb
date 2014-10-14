
def analyze(text)
  # TODO: should analyze the text, and return the result hash with all features
  analysis = {}
  analysis[:line_count] = text.count("\n") + 1
  analysis[:character_count] = text.length
  analysis[:word_count] = text.split(" ").length
  analysis[:sentence_count] = text.split(".").length
  analysis[:paragraph_count] = text.split("\n\n").length
  analysis[:average_words_per_sentence] = analysis[:word_count] / analysis[:sentence_count] \
if analysis[:sentence_count] != 0
  analysis[:average_sentences_per_paragraph] = analysis[:sentence_count] / analysis[:paragraph_count]  \
if analysis[:paragraph_count] != 0
  analysis
end




# file = File.open("lib/test.txt")
# content = ""
# count_line = 1
# file.each { |line|
#   content << line
#   count_line += 1

# }

# p count_line
# p content
# p analyze(content)