get '/news' do
@articles = Article.all.sort_by(&:publish_date).reverse
 erb :"update"
end

get "/news/update" do #idk what to name this route, for saving stuff to database
  @ign_api = HTTParty.get("https://newsapi.org/v1/articles?source=ign&sortBy=top&apiKey=#{ENV['APIKEY']}")
  @techcrunch_api = HTTParty.get("https://newsapi.org/v1/articles?source=techcrunch&sortBy=top&apiKey=#{ENV['APIKEY']}")
  @hackernews_api = HTTParty.get("https://newsapi.org/v1/articles?source=hacker-news&sortBy=top&apiKey=#{ENV['APIKEY']}")
  @bbc_api = HTTParty.get("https://newsapi.org/v1/articles?source=bbc-news&sortBy=top&apiKey=#{ENV['APIKEY']}")
  @espn_api = HTTParty.get("https://newsapi.org/v1/articles?source=espn&sortBy=top&apiKey=#{ENV['APIKEY']}")
  @buzzfeed_api = HTTParty.get("https://newsapi.org/v1/articles?source=buzzfeed&sortBy=top&apiKey=#{ENV['APIKEY']}")

  parser(@ign_api, 1)
  parser(@techcrunch_api, 2)
  parser(@hackernews_api, 3)
  parser(@bbc_api,4)
  parser(@espn_api, 5)
  parser(@buzzfeed_api, 6)


# ign = 1
# techcrunch = 2
# hackernews = 3

  redirect "/"
end

get "/news/:provider_id" do
@articles = Article.where(provider_id: params[:provider_id])
  erb :"source"
end


