require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    index_page = Nokogiri::HTML(open(index_url))

    scraped_students = []

    index_page.css(".student-card").each do |student|
      student_info = {}
      student_info[:name] = student.css(".student-name").text
      student_info[:location] = student.css(".student-location").text
      student_info[:profile_url] = student.css("a").attribute("href").text
      scraped_students << student_info
      #binding.pry
    end
    scraped_students

  end

  def self.scrape_profile_page(profile_url)
    # is a class method that scrapes a student's profile page and returns a hash of attributes describing an individual student (FAILED - 2)
    # can handle profile pages without all of the social links (FAILED - 3)
  end

end
