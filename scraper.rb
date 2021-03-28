# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'csv'

html = open('https://br.advfn.com/bolsa-de-valores/bovespa/enjoei-com-br-atividades-on-ENJU3/cotacao')
response = Nokogiri::HTML(html)
stock_response = response.css('div#quote_top div.TableElement table tr.odd')

data_arr = []
stock_name = stock_response.css('td b')[0].text
stock_code = stock_response.css('td b')[1].text
day_variation = stock_response.css('td.change').text
current_price = stock_response.css('td.current_price').text
hour = stock_response.css('td span#quoteElementPiece11').text
business_number = stock_response.css('td span#quoteElementPiece20').text
last_business = stock_response.css('td span#quoteElementPiece24').text
job_timestamp = Time.now

data_arr.push([stock_name,
               stock_code,
               day_variation,
               current_price,
               hour,
               business_number,
               last_business,
               job_timestamp])

CSV.open('data.csv', "a+") do |csv|
  csv << [stock_name,stock_code, day_variation, current_price, hour, business_number, last_business, job_timestamp]
end
