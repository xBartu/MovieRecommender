require 'nokogiri'
require 'open-uri'



class ScraperMoviePage
  # Scrapper class
  def initialize(url)
    # init class
    @htmlp = Nokogiri::HTML(open(url))
  end

  def get_title
    @htmlp.css('h1').text
  end
end

page = ScraperMoviePage.new('https://www.imdb.com/title/tt2306299/?ref_=adv_li_tt')
puts page.get_title
