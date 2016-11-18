json.extract! bookgenre, :id, :book_id, :genre_id, :created_at, :updated_at
json.url bookgenre_url(bookgenre, format: :json)
