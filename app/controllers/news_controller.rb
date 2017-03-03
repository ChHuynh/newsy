get '/' do
  @ign_api = HTTParty.get("https://newsapi.org/v1/articles?source=ign&sortBy=top&apiKey=#{ENV['APIKEY']}")

  @techcrunch_api = HTTParty.get("https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=#{ENV['APIKEY']}")

  @hackernews_api = HTTParty.get("https://newsapi.org/v1/articles?source=hacker-news&sortBy=top&apiKey=#{ENV['APIKEY']}")
  erb :"index"
end

