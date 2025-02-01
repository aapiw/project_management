
# Prerequisites
Backend:
- Rbenv
- Ruby 2.7.7
- Rails 6
- Postgres
- Bundler: 2.4.22

Frontend:
- nvm
- node v19.7.0
- pnpm

# Setup The Project
Clone the project
```
git clone git@github.com:aapiw/project_management.git
```

And then execute this under `project_management` dir:
```bash
bundle install
```

```bash
pnpm install
```

Setup the DB:
Update username & password of config/database.yml accordingly

```
RAILS_ENV=development rails db:drop; rails db:create; rails db:migrate; rails db:seed;
```

# Run The Project
Run the Backend:
```
rails s
```

Run the Frontend in a new tab:
```
bin/vite dev
```

Open http://localhost:3000/

# Accounts
Admin:

user: admin@yopmail.com

password: password

User:

user: user1@yopmail.com

password: password

Also can check from `db/seeds.rb`

# API
Documentation:
https://documenter.getpostman.com/view/33611537/2sAYX3qhzC

Also can export the json postman collection available in the root
`Project Management.postman_collection.json`