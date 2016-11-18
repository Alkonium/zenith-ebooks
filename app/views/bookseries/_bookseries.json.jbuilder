json.extract! bookseries, :id, :book_id, :series_id, :position, :created_at, :updated_at
json.url bookseries_url(bookseries, format: :json)
