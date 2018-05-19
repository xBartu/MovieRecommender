json.extract! star, :id, :fname, :lname, :bio, :photo_url, :created_at, :updated_at
json.url star_url(star, format: :json)
