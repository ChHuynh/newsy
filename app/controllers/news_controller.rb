get '/news' do
  @ign_api = HTTParty.get("https://newsapi.org/v1/articles?source=ign&sortBy=top&apiKey=#{ENV['APIKEY']}")
  
  @techcrunch_api = HTTParty.get("https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=#{ENV['APIKEY']}")

  @hackernews_api = HTTParty.get("https://newsapi.org/v1/articles?source=hacker-news&sortBy=top&apiKey=#{ENV['APIKEY']}")
  erb :"index"
end

get '/news/ign' do
  @latest_ign = HTTParty.get("https://newsapi.org/v1/articles?source=ign&sortBy=latest&apiKey=#{ENV['APIKEY']}")

  erb :"ign"
end

get '/news/techcrunch' do
  @latest_techcrunch = HTTParty.get("https://newsapi.org/v1/articles?source=techcrunch&sortBy=latest&apiKey=#{ENV['APIKEY']}")

  erb :"techcrunch"
end

get '/news/hackernews' do
  @latest_hackernews = HTTParty.get("https://newsapi.org/v1/articles?source=hacker-news&sortBy=latest&apiKey=#{ENV['APIKEY']}")

  erb :"hackernews"
end
