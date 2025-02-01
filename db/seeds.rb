admin = User.create!(name: 'Admin 1', email: 'admin@yopmail.com', role: :admin, password: 'password')

user1 = User.create!(name: 'User 1', email: 'user1@yopmail.com', role: :user, password: 'password')
user2 = User.create!(name: 'User 2', email: 'user2@yopmail.com', role: :user, password: 'password')
user3 = User.create!(name: 'User 3', email: 'user3@yopmail.com', role: :user, password: 'password')
user4 = User.create!(name: 'User 4', email: 'user4@yopmail.com', role: :user, password: 'password')
user5 = User.create!(name: 'User 5', email: 'user5@yopmail.com', role: :user, password: 'password')
user6 = User.create!(name: 'User 6', email: 'user6@yopmail.com', role: :user, password: 'password')
project1 = Project.create!(name: 'Project 1', start_date: Date.today-30, duration: '5 months')
project2 = Project.create!(name: 'Project 2', start_date: Date.today - 30, duration: '6 months')
project3 = Project.create!(name: 'Project 3', start_date: Date.today - 5, duration: '4 months')
project4 = Project.create!(name: 'Project 4', start_date: Date.today - 8, duration: '5 months')
project5 = Project.create!(name: 'Project 4', start_date: Date.today + 2, duration: '2 months')
project6 = Project.create!(name: 'Project 5', start_date: Date.today + 1, duration: '2 months')


ProjectAssignment.create!(user: user1, project: project1)
ProjectAssignment.create!(user: user2, project: project1)
ProjectAssignment.create!(user: user3, project: project1)
ProjectAssignment.create!(user: user4, project: project1)


ProjectAssignment.create!(user: user1, project: project2)
ProjectAssignment.create!(user: user2, project: project2)
ProjectAssignment.create!(user: user3, project: project2)

ProjectAssignment.create!(user: user1, project: project3)
ProjectAssignment.create!(user: user3, project: project3)
ProjectAssignment.create!(user: user4, project: project3)
ProjectAssignment.create!(user: user5, project: project3)

project1.tasks.create([
  {name: "Homepage Design", description: "Homepage design desc", start_time: "2025-01-28 08:00:00".to_time, end_time: "2025-01-28 10:00:00".to_time, duration: 2},
  
  {name: "Backend Setup", description: "Backend setup desc", start_time: "2025-01-28 11:00:00".to_time, end_time: "2025-01-28 17:00:00".to_time, duration: 5},

  {name: "Homepage Design 2", description: "Homepage design desc", start_time: "2025-02-10 08:00:00".to_time, end_time: "2025-02-10 10:00:00".to_time, duration: 2},
  
  {name: "Backend Setup 3", description: "Backend setup desc", start_time: "2025-02-10 11:00:00".to_time, end_time: "2025-02-10 17:00:00".to_time, duration: 5}
])

project2.tasks.create([
  {name: "Homepage Design", description: "Homepage design desc", start_time: "2025-01-28 08:00:00".to_time, end_time: "2025-01-28 10:00:00".to_time, duration: 2},
  
  {name: "Backend Setup", description: "Backend setup desc", start_time: "2025-01-28 11:00:00".to_time, end_time: "2025-01-28 17:00:00".to_time, duration: 5},

  {name: "Homepage Design 2", description: "Homepage design desc", start_time: "2025-02-10 08:00:00".to_time, end_time: "2025-02-10 10:00:00".to_time, duration: 2},
  
  {name: "Backend Setup 3", description: "Backend setup desc", start_time: "2025-02-10 11:00:00".to_time, end_time: "2025-02-10 17:00:00".to_time, duration: 5}
])


Task.create([
  {name: "Task 1", description: "Task 1", start_time: "2025-03-28 08:00:00".to_time, end_time: "2025-03-28 10:00:00".to_time, duration: 2},
  
  {name: "Task 2", description: "Task 2", start_time: "2025-03-28 11:00:00".to_time, end_time: "2025-03-28 17:00:00".to_time, duration: 5},

  {name: "Task 3", description: "Task 3", start_time: "2025-03-10 08:00:00".to_time, end_time: "2025-03-10 10:00:00".to_time, duration: 2},
  
  {name: "Task 4", description: "Task 4", start_time: "2025-03-10 11:00:00".to_time, end_time: "2025-03-10 17:00:00".to_time, duration: 5}
])