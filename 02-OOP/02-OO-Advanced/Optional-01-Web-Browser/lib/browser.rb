require 'nokogiri'
require 'open-uri'

class Browser
  def fetch_content(url)
    content = Nokogiri::HTML(open(url))
    return content.content
  end
end
