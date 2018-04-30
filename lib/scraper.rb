require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    scraped_students = []
    doc.css(".student-card").each do |student|
      student_hash = {}
      student_hash[:name] = student.css(".student-name").text
      student_hash[:location] = student.css(".student-location").text
      student_hash[:profile_url] = student.css("a").attribute("href").value
      scraped_students << student_hash
    end
    scraped_students
  end

  def self.scrape_profile_page(profile_url)
      doc = Nokogiri::HTML(open(profile_url))
      student_hash = {}
      links = doc.css(".social-icon-container").children.css("a")
      links.each do |link|
      link = link.attribute("href").value
        binding.pry
      end
      student_hash
    end


end
