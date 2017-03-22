def parser(api_source, news_source)
  api_source["articles"].each do |article|
    @title = article["title"]
    @description = article["description"]
    @url = article["url"]
    @publish_date = article["publishedAt"]
    Article.find_or_create_by(title: @title, description: @description, url: @url, publish_date: @publish_date, source: news_source)
  end
end

