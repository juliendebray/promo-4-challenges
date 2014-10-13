def group_mails(emails)
  # TODO: group email by provider
  group = {}
  emails.map!  do |n|
    n.gsub("\n", "")
  end
  emails.reject! { |c| c.empty? }
  emails.each do |email|
    if (group[email.match(/@.+\./).to_s[1...-1]]).nil?
      group[email.match(/@.+\./).to_s[1...-1]] = ["#{email}"]
    else
      group[email.match(/@.+\./).to_s[1...-1]] << email
    end
  end
  # group[nil] = nil
  return group
end


# user_emails = %w(bob@yahoo.fr roger57@hotmail.fr bigbox@yahoo.fr \
# boris@lewagon.org monsieur.olivier@gmail.com monsieur.mack@gmail.com)



def provider?(email, provider)
  # TODO: return true if email is of given provider
  hash = group_mails(email.split)
  return hash.key?(provider)
end

# p provider?("seb@gmail.com", "gmail")
# p provider?("seb@gmail.com", "hotmail")