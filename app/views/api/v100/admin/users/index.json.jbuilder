json.total_count @users.size
json.status 200
json.success true

json.data @users do |user|
  json.id user.id
  json.name user.name
  json.email user.email
end
