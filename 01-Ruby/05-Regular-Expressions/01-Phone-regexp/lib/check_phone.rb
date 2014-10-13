def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number.gsub(/\s+|-/,"").match(/^0[1-9][0-9]{8}|^\+33[0-9]{9}/)
    return true
  else
    return false
  end
end
