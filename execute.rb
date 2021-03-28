require_relative 'scraper'

url = 'https://br.advfn.com/bolsa-de-valores/bovespa/enjoei-com-br-atividades-on-ENJU3/cotacao'
Scraper.new(url).scrape_page
