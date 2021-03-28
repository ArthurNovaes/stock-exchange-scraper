require 'minitest/autorun'
require_relative 'scraper'

class ScraperTest < Minitest::Test
  def test_correct_url
    url = 'https://br.advfn.com/bolsa-de-valores/bovespa/enjoei-com-br-atividades-on-ENJU3/cotacao'
  end
end
