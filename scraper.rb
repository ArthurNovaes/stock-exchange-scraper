# frozen_string_literal: true

require 'open-uri'
require 'json'
require_relative 'parser'

class Scraper
  attr_reader :url, :file_path

  def initialize(url, file_path)
    @url = url
    @file_path = file_path
  end

  def scrape_page
    html = open(url)
    result = Parser.new(html).parse

    if result == 'ERROR, invalid url'
      return "🔺 🔺 🔺 🔺 🔺  #{result} 🔺 🔺 🔺 🔺 "
    end

    file = File.read(file_path)
    send_to_json(file, result)
  end

  private

  def send_to_json(file, obj)
    data_from_json = file.empty? ? [] : JSON[file]
    data_from_json = [data_from_json] if data_from_json.class != Array
    File.open(file_path, 'w') do |json|
      json.write(JSON.pretty_generate(data_from_json << obj))
      return '🔹 🔹 🔹 DONE🔹 🔹 🔹'
    end
  end
end
