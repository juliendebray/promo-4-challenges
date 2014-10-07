def coach_answer(your_message)
  if your_message.split("").last == "?"
    return "Silly question, get dressed and go to work!"
  elsif your_message == "I am going to work right now!"
    return ""
  else
    return "I don't care, get dressed and go to work!"
  end
end


def coach_answer_enhanced(your_message)
  if your_message == "I AM GOING TO WORK RIGHT NOW!"
    return ""
  elsif your_message == your_message.upcase
    return "I can feel your motivation! I don't care, get dressed and go to work!"
  elsif (your_message == your_message.upcase) && (your_message.split("").last == "?")
    return "I can feel your motivation! Silly question, get dressed and go to work!"
  else
    return coach_answer(your_message)
  end
end

