class Scraping
  def self.movie_urls
    agent = Mechanize.new
    links = []
    next_url = ""
 
      while true
          current_page = agent.get("https://filmarks.com/list/now" + next_url)
          elements = current_page.search('.p-movie-cassette')
          elements.each do |ele|
              links << ele.get_attribute('data-clip').match(/"movie_id":(\d+)/)[1]
          end
 
          next_link = current_page.at('.c-pagination__next').get_attribute('href')
          break unless next_link
          next_url = next_link.slice!(/\?.*/)
      end
      links.each do |link|
          get_product('https://filmarks.com/movies/' + link)
      end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    title = page.at('.p-content-detail__title span').inner_text if page.at('.p-content-detail__title')
 
    image_url = page.at('.c-content__jacket img')[:src] if page.at('.c-content__jacket img')
    director = page.at('.p-content-detail__people-list-desc a').inner_text if page.at('.p-content-detail__people-list-desc a')
    detail = page.at('.p-content-detail__synopsis-desc .is-show-all').inner_text if page.at('.p-content-detail__synopsis-desc .is-show-all')
    open_date = page.at('.p-content-detail__other-info h3').inner_text.slice!(/(2018|2019).*/) if page.at('.p-content-detail__other-info h3')

    product = Product.where(title: title).first_or_initialize
    product.image_url = image_url
    product.director = director
    product.detail = detail
    product.open_date = open_date
    product.save
  end
end