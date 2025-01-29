json.total_count @projects.size
json.status 200
json.success true

json.data @projects do |project|
  json.id project.id
  json.name project.name
  json.start_date project.start_date
  json.duration project.duration
  
  json.total_tasks project.tasks.size
  json.total_task_duration Project.display_hour(project&.tasks&.pluck(:duration)&.reduce(:+))
  json.tasks project.tasks do |task|
    json.id task.id
    json.name task.name
    json.description task.description
    json.start_time task.start_time
    json.end_time task.end_time
    json.duration Project.display_hour(task.duration)
    json.created_at task.created_at
    json.updated_at task.updated_at
  end
end
