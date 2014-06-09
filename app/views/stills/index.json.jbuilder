json.array!(@stills) do |still|
  json.extract! still, :id, :film_id, :image
  json.url still_url(still, format: :json)
end
