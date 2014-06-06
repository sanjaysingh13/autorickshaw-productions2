json.array!(@films) do |film|
  json.extract! film, :id, :name, :link, :url, :writeup, :credits, :feature
  json.url film_url(film, format: :json)
end
