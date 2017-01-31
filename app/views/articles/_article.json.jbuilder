json.extract! article, :id, :content, :title, :author_id, :category_id, :created_at, :updated_at
json.url article_url(article, format: :json)