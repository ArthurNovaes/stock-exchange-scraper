# frozen_string_literal: true

require 'open-uri'
require 'json'
require_relative 'parser'

class Scraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def scrape_page
    html = open(url)
    result = Parser.new(html).parse

    if result == 'ERROR, invalid url'
      return puts "🔺 🔺 🔺 🔺 🔺  #{result} 🔺 🔺 🔺 🔺 "
    end

    file = File.read('./data/stock.json')
    send_to_json(file, result)
  end

  private

  def send_to_json(file, obj)
    data_from_json = file.empty? ? [] : JSON[file]
    data_from_json = [data_from_json] if data_from_json.class != Array
    File.open('./data/stock.json', 'w') do |json|
      json.write(JSON.pretty_generate(data_from_json << obj))
      puts '🔹 🔹 🔹 DONE🔹 🔹 🔹'
    end
  end
end
