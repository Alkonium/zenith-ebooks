json.extract! series, :id, :title, :synopsis, :created_at, :updated_at
json.url series_url(series, format: :json)