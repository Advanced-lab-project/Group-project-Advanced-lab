# Lab Equipment API

A Rails API for managing laboratory equipment, categories, and maintenance records.  
The system helps track equipment availability, maintenance history, and enforce business rules for reliable lab data.

Repository: https://github.com/Advanced-lab-project/Group-project-Advanced-lab

---

# Tech Stack

- Ruby on Rails API
- SQLite
- ActiveRecord

---

# Setup

```bash
git clone https://github.com/Advanced-lab-project/Group-project-Advanced-lab.git

cd Group-project-Advanced-lab

bundle install

bin/rails db:create db:migrate db:seed

bin/rails server
```

Server:

```txt
http://localhost:3000
```

-

# Models

## Category

- name (required, unique, minimum 3 characters)
- has_many :equipment

## Equipment

- name (required)
- serial_number (required, unique, format XXX-NNN)
- status (available, in_use, maintenance)
- belongs_to :category
- has_many :maintenance_records

## MaintenanceRecord

- description (required)
- performed_at (cannot be future)
- belongs_to :equipment

# API Endpoints

## Categories

| Method | Endpoint        |
| ------ | --------------- |
| GET    | /categories     |
| GET    | /categories/:id |
| POST   | /categories     |
| PATCH  | /categories/:id |
| DELETE | /categories/:id |

## Equipment

| Method | Endpoint                    |
| ------ | --------------------------- |
| GET    | /equipment                  |
| GET    | /equipment?status=available |
| GET    | /equipment/:id              |
| POST   | /equipment                  |
| PATCH  | /equipment/:id              |
| DELETE | /equipment/:id              |

## Maintenance Records

| Method | Endpoint                            |
| ------ | ----------------------------------- |
| GET    | /maintenance_records                |
| GET    | /maintenance_records?equipment_id=1 |
| GET    | /maintenance_records/:id            |
| POST   | /maintenance_records                |
| PATCH  | /maintenance_records/:id            |
| DELETE | /maintenance_records/:id            |

# Response Codes

| Status | Meaning          |
| ------ | ---------------- |
| 200    | Success          |
| 201    | Created          |
| 204    | Deleted          |
| 404    | Not Found        |
| 409    | Conflict         |
| 422    | Validation Error |

# Task Assignment

| Task                 | Owner       | Branch             | Status      |
| -------------------- | ----------- | ------------------ | ----------- |
| 1 - Data model       | @merryoon   | task-1-model       | In Progress |
| 2 - Seed data        | @veyron44   | task-2-seeds       | In Progress |
| 3 - Category CRUD    | @lyyzw-cqzz | task-3-categories  | In Progress |
| 4 - Equipment CRUD   | @osaama-a   | task-4-equipment   | In Progress |
| 5 - Maintenance CRUD | @lyyzw-cqzz | task-5-maintenance | Not Started |
| 6 - Business rules   | @veyron44   | task-6-rules       | Not Started |
| 7 - Edge cases       | @merryoon   | task-7-edge-cases  | Not Started |

---

# Team Members

- Rahel — @veyron44
- Usama — @osaama-a
- Meron — @merryoon
- Mariamsina — @lyyzw-cqzz
