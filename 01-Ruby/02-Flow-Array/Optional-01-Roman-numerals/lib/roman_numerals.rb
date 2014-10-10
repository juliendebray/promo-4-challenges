def repeat(text,c)
   [text].cycle(c).to_a.join('')
end

def old_roman_numeral(an_integer)
  # TODO: translate integer in roman number - old-style way
  mille = an_integer.divmod(1000)
  cinq_ct = mille[1].divmod(500)
  cent = cinq_ct[1].divmod(100)
  cqte = cent[1].divmod(50)
  dix = cqte[1].divmod(10)
  cinq = dix[1].divmod(5)
  un = cinq[1]
  return repeat("M",mille[0]) + repeat("D",cinq_ct[0]) + repeat("C",cent[0]) + repeat("L",cqte[0]) + repeat("X",dix[0]) + repeat("V", cinq[0]) + repeat("I", un)
end


def new_roman_numeral(an_integer)
  # TODO: translate integer in roman number - modern-style way
  number = old_roman_numeral(an_integer)
  number.gsub!("DCCCC", "CM") if number.gsub("DCCCC", "CM") != nil
  number.gsub!("LXXXX", "XC") if number.gsub("LXXXX", "XC") != nil
  number.gsub!("VIIII", "IX") if number.gsub("VIIII", "IX") != nil
  number.gsub!("CCCC", "CD") if number.gsub("CCCC", "CD") != nil
  number.gsub!("XXXX", "XL") if number.gsub("XXXX", "XL") != nil
  number.gsub!("IIII", "IV") if number.gsub("IIII", "IV") != nil
  number
end

