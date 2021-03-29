require 'minitest/autorun'
require_relative 'scraper'

class ScraperTest < Minitest::Test
  def test_correct_url
    url = 'https://br.advfn.com/bolsa-de-valores/bovespa/enjoei-com-br-atividades-on-ENJU3/cotacao'
    path = './data/stock_test.json'

    expected_result = '🔹 🔹 🔹 DONE🔹 🔹 🔹'
    scraper_result = Scraper.new(url, path).scrape_page

    assert_equal expected_result, scraper_result
    File.truncate(path, 0)
  end

  def test_correct_url_json_fields
    url = 'https://br.advfn.com/bolsa-de-valores/bovespa/enjoei-com-br-atividades-on-ENJU3/cotacao'
    path = './data/stock_test.json'

    expected_result = {
      stock_name: 'Enjoei.Com.Br Atividades De Internet S.A',
      stock_code: 'ENJU3',
      day_variation: '0,00',
      current_price: '10,25',
      hour: '19:45:02',
      business_number: '5.217',
      last_business: '17:07:00',
      job_timestamp: Time.now
    }
    Scraper.new(url, path).scrape_page
    file = File.read(path)
    json_result = JSON.parse(file)

    assert_equal expected_result[:stock_name], json_result.first['stock_name']
    assert_equal expected_result[:stock_code], json_result.first['stock_code']
    assert_equal expected_result[:job_timestamp].strftime('%d/%m/%Y %k:/%M'),
                 DateTime.parse(json_result.first['job_timestamp'])
                         .to_time.strftime('%d/%m/%Y %k:/%M')

    File.truncate(path, 0)
  end

  def test_incorrect_url
    url = 'https://google.com'
    path = './data/stock_test_.json'

    expected_result = '🔺 🔺 🔺 🔺 🔺  ERROR, invalid url 🔺 🔺 🔺 🔺 '
    scraper_result = Scraper.new(url, path).scrape_page

    assert_equal expected_result, scraper_result
  end
end
