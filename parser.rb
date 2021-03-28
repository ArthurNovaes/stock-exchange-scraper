require 'nokogiri'

class Parser
  attr_reader :response

  def initialize(response)
    @response = Nokogiri::HTML(response)
                        .css('div#quote_top div.TableElement table tr.odd')
  end

  def parse
    return 'ERROR, invalid url' if response.empty?

    result_obj = {
      stock_name: response.css('td b')[0].text,
      stock_code: response.css('td b')[1].text,
      day_variation: response.css('td.change').text,
      current_price: response.css('td.current_price').text,
      hour: response.css('td span#quoteElementPiece11').text,
      business_number: response.css('td span#quoteElementPiece20').text,
      last_business: response.css('td span#quoteElementPiece24').text,
      job_timestamp: Time.now
    }

    result_obj
  end
end
