json.array!(@emptyings) do |emptying|
  json.extract! emptying, :id, :user_id
  json.url emptying_url(emptying, format: :json)
end
