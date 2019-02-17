require 'Mechanize'
agent = Mechanize.new
page =  agent.get("https://filmarks.com/movies/60431")
puts details = page.at('.p-content-detail__synopsis')
