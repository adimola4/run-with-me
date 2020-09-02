json.extract! training, :id, :title, :date, :duration, :participants, :user_id, :location, :zipcode, :public, :status, :training_type, :details, :created_at, :updated_at
json.url training_url(training, format: :json)
