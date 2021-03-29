require_relative 'scraper'

url = 'https://br.advfn.com/bolsa-de-valores/bovespa/enjoei-com-br-atividades-on-ENJU3/cotacao'
path = './data/stock.json'
Scraper.new(url, path).scrape_page
