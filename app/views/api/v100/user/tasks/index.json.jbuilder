json.status 200
json.success true

json.data do
  json.available_tasks @available_tasks do |task|
    json.id task.id
    json.name task.name
    json.description task.description
    json.start_time task.start_time
    json.end_time task.end_time
    json.duration task.duration
    json.project_id task.project_id
  end
  # json.assigned_tasks @assigned_tasks do |task|
  #   json.id task.id
  #   json.name task.name
  #   json.description task.description
  #   json.start_time task.start_time
  #   json.end_time task.end_time
  #   json.duration task.duration
  #   json.project_id task.project_id
  # end
end
