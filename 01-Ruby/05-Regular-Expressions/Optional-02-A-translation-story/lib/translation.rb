STRINGS = {
  home: {
    intro: {
      en: 'Welcome on Le Wagon',
      fr: 'Bienvenue sur Le Wagon'
    },
    content: {
      explanation: {
        en: 'This is an interesting exercise',
        fr: 'C\'est un exercice interessant',
        de: 'Es ist eine interesante Ãbung'
      },
      goodbye: {
        en: 'Goodbye',
        fr: 'Au revoir',
        es: 'Adios'
      }
    }
  }
}


def translation(a_string, a_language = :en)
  path = a_string.split(".")
  path.map! { |symb| symb.to_sym }
  val = STRINGS
  path.each do |symb|
    val = val[symb]
    return "" if val.nil?
  end
  if val == ""
    return ""
  else
    if val[a_language.to_sym].nil?
      return val[:en]
    else
      return val[a_language.to_sym]
    end
  end
end

p translation('home.intro', 'fr')
p translation('home.content.goodbye')
p translation('unvalid.path', 'en')