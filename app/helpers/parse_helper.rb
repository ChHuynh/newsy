def parser(api_source, provider_id)
  api_source["articles"].each do |article|
    @title = article["title"]
    @description = article["description"]
    @url = article["url"]
    @publish_date = article["publishedAt"]
    Article.find_or_create_by(title: @title, description: @description, url: @url, publish_date: @publish_date, provider_id: provider_id)
  end
end

