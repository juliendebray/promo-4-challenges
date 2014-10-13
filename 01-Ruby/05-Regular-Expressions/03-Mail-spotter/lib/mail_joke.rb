# Encoding: utf-8

def email_user(email)
  return email.match(/.+@/).to_s[0...- 1].gsub(".", " ")
end

def email_domain(email)
  return email.match(/@.+/).to_s[1..- 1].gsub(".", " ")
end

# p email_user("boris.dupon@lew.fr")
# p email_domain("boris.dupon@lew.fr")


def mail_joke(email)
  # TODO: Return (not print!) a joke suited to the email provided
  if (email.include? "@") && (email.include? ".")
    case email_domain(email).downcase
    when "lewagon org"
      return "Well done #{email_user(email)}, you're skilled and capable"
    when "gmail com"
      return "#{email_user(email)}, you're an average but modern person"
    when "live com"
      return "#{email_user(email)}, aren't you born before 1973?"
    else
      return "Sorry #{email_user(email)}, we don't know how to judge '#{email_domain(email).gsub(" ", ".")}'"
    end
  else
    fail ArgumentError, "Email is not valid"
  end
end

p mail_joke("boris.nom@live.com")




