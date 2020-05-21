require 'rubygems'
require 'nokogiri' #demande la gem Nokogiri
require 'open-uri' #nécessaire pour ouvrir un site

def crypto_scrapper
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) #appelle le site à ouvrir
    
    #maintenant on va aller chercher les Xpaths pour symbol et price : on peut les trouver avec Chropath (uniquement sur Google Chrome)
    column_symbols = '//div[@class="cmc-table__table-wrapper-outer"]/div/table/tbody/tr[@class="cmc-table-row"]/td[contains(@class, "symbol")]'
    column_prices = '//div[@class="cmc-table__table-wrapper-outer"]/div/table/tbody/tr[@class="cmc-table-row"]/td[contains(@class, "price")]'
    
    symbols_length = page.xpath(column_symbols).length
   
    array_crypto = array_creation(page, column_symbols, column_prices, symbols_length)
    
    
end

def array_creation(page, column_symbols, column_prices, symbols_length)
  array_crypto = Array.new #création d'un arrêt vide
  
  (0..symbols_length-1).each { |n|
    hash_crypto = Hash.new #création d'un hash vide
    hash_crypto[page.xpath(column_symbols)[n].text] = page.xpath(column_prices)[n].text.delete('$,')
    
    array_crypto << hash_crypto
    
     }
  
  return array_crypto
end


print crypto_scrapper