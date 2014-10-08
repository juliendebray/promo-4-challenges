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

puts "1 = " + old_roman_numeral(1)
puts "4 = " + old_roman_numeral(4)
puts "5 = " + old_roman_numeral(5)
puts "8 = " + old_roman_numeral(8)
puts "10 = " + old_roman_numeral(10)
puts "17 = " + old_roman_numeral(17)
puts "54 = " + old_roman_numeral(54)
puts "985 = " + old_roman_numeral(985)

def new_roman_numeral(an_integer)
  # TODO: translate integer in roman number - modern-style way
end



