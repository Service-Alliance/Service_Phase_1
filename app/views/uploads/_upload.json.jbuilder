json.extract! upload, :category, :created_at, :description, :pricing
json.uploads upload.uploads do |u|
  json.filename u.file.filename
  json.url u.url
end
