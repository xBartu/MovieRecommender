json.extract! genre, :id, :title, :desc, :photo_url, :created_at, :updated_at
json.url genre_url(genre, format: :json)
