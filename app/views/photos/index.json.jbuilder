json.array!(@photos) do |photo|
  json.extract! photo, :id, :name, :base_url, :filter, :final_url
  json.url photo_url(photo, format: :json)
end
