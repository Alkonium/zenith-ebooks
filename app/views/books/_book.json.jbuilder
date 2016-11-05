json.extract! book, :id, :title, :price, :words, :published, :synopsis, :created_at, :updated_at
json.url book_url(book, format: :json)