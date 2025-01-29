json.total_count @projects.size
json.status 200
json.success true

json.data @projects do |project|
  json.id project.id
  json.name project.name
  json.start_date project.start_date
  json.duration project.duration
end
