# Encoding: utf-8
def put_suffix(a_word)
  a_word << %w(em é ji oc ic uche ès).shuffle[0]
end

p put_suffix("test")

def method_to_use(a_word)
  if %w(A E I O U Y).include? (a_word[0].upcase)
    "with_vowel"
  elsif !(%w(A E I O U Y).include? (a_word[0].upcase)) && !(%w(A E I O U Y).include? (a_word[1].upcase))
    "with cons"
  else
    "normal"
  end
end

p method_to_use("chat")

def with_vowel_translate(a_word_vowel)
  "l#{put_suffix(a_word_vowel)}"
end

p with_vowel_translate("oui")

def with_cons_translate(a_word)
  until (%w(A E I O U Y).include? (a_word[0].upcase))
    a_word << a_word[0]
    a_word = a_word[1..-1]
  end
  "l#{put_suffix(a_word)}"
end

p with_cons_translate("chat")
p with_cons_translate("atout")


def louchebemize(sentence)
  # TODO: implement your louchebem translator
  translate = []
  tab = sentence.split(/\b/)
  translate = tab
  tab.each do |x|
    if x.match(/\W/)
      translate << x
    elsif x.length == 1
      translate << x
    else x.length > 1
      case method_to_use(x)
      when "with_vowel"
        translate << with_vowel_translate(x)
      when "with cons"
        translate << with_cons_translate(x)
      when "normal"
        translate << put_suffix(x)
      end
    end
  end
  #translate
  a = translate.join
  # a.gsub(" !","!").gsub(" ?","?").gsub(" .",".").gsub(" ' ","'").gsub(" ,",",")
end

puts louchebemize("chat, atout, bonjour! Hello?")