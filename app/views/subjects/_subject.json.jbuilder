json.extract! subject, :id, :type, :term, :name, :abbreviation, :created_at, :updated_at
json.url subject_url(subject, format: :json)
