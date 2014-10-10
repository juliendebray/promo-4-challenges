# Encoding: utf-8
def put_suffix(a_word)
  a_word << ["em", "é", "ji", "oc", "ic", "uche", "ès"].shuffle[0]
end


def method_to_use(a_word)
  if ["A", "E", "I", "O", "U", "Y"].include? (a_word[0].upcase)
    "with_vowel"
  elsif !(["A", "E", "I", "O", "U", "Y"].include? (a_word[0].upcase)) && !(["A", "E", "I", "O", "U", "Y"].include? (a_word[1].upcase))
    "with cons"
  else
    "normal"
  end
end


def with_vowel_translate(a_word_vowel)
  "l#{put_suffix(a_word_vowel)}"
end

def with_cons_translate(a_word)
  until (["A", "E", "I", "O", "U", "Y"].include? (a_word[0].upcase))
    a_word << a_word[0]
    a_word = a_word[1..-1]
  end
  "l#{put_suffix(a_word)}"
end



def louchebemize(sentence)
  # TODO: implement your louchebem translator
  tab = sentence.split( /\s+|\b/ )
  translate = tab
  tab.each_with_index do |x, i|
    if x.length > 1
      case method_to_use(x)
        when "with_vowel"
          translate[i] = with_vowel_translate(x)
        when "with cons"
          translate[i] = with_cons_translate(x)
        when "normal"
          translate[i] = put_suffix(x)
      end
    else
      translate[i] = x
    end
  end
  a = translate.join(" ")
  a.gsub(" !","!").gsub(" ?","?").gsub(" .",".").gsub(" ' ","'").gsub(" ,",",")
end


puts louchebemize("chat, atout, bonjour! Hello?")