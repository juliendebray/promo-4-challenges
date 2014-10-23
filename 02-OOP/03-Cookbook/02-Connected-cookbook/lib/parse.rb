require 'nokogiri'
require 'open-uri'

class Parse

  def parse_marmiton(query)
    recipes_table = []
    count = 0
    doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{query}"), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |element|
      recipes_table[count] = {
        title: element.search('.m_titre_resultat > a').inner_text,
        description: (element.search('.m_texte_resultat').inner_text)[0..150] + "...",
        prep_time: (element.search('.m_detail_time > div')).children[1].to_s.strip(),
        cook_time: (element.search('.m_detail_time > div')).children[3].to_s.strip(),
        rating: "#{element.search('.m_recette_note1').size} / 5",
        nb_of_votes: element.search('.m_recette_nb_votes').inner_text,
        difficuty: (element.search('.m_detail_recette').inner_text).match(/(Très facile|Facile|Moyenne|Difficile)/).to_s
      }
      count += 1
    end
    return recipes_table
  end
 def parse_marmiton_with_difficulty(query, difficulty)
    recipes_table = []
    count = 0
    doc = Nokogiri::HTML(open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{query}"), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |element|
      if (element.search('.m_detail_recette').inner_text).match(difficulty)
        recipes_table[count] = {
          title: element.search('.m_titre_resultat > a').inner_text,
          description: (element.search('.m_texte_resultat').inner_text)[0..150] + "...",
          prep_time: (element.search('.m_detail_time > div')).children[1].to_s.strip(),
          cook_time: (element.search('.m_detail_time > div')).children[3].to_s.strip(),
          rating: "#{element.search('.m_recette_note1').size} / 5",
          nb_of_votes: element.search('.m_recette_nb_votes').inner_text,
          difficuty: (element.search('.m_detail_recette').inner_text).match(/(Très facile|Facile|Moyenne|Difficile)/).to_s
        }
        count += 1
      end
    end
    return recipes_table
  end
end



test = Parse.new
p test.parse_marmiton_with_difficulty("lapin", "Facile")