# SpotMySeat

## Technologys

- Ruby
- Rails
- TailwindCSS
- Bundler
- SQLite3 (oder eine andere Datenbank deiner Wahl)

## Installation

1. Clone the Repository:

```bash
git clone https://github.com/levin-fankhauser/spot_my_seat.git
cd spot_my_seat
```

2. Install dependencies

```bash
bundle install
rails tailwindcss:install
```

3. Configure database

```bash
rails db:create
rails db:migrate
```

4. Start Server

```bash
bin/dev
```

oder

```bash
rails s
```

5. Open app on [localhost:3000](localhost:3000)

## Make user an admin

1. Create User in app via "Sign Up"
2. Go into your rails console in your terminal

```bash
rails console
```

3. Identify user by email and declare role as admin

```bash
User.find_by(email: '<your@mail.com>')&.update(role: 'admin')
```

## Connect do PostgreSQL Database

1. Open Postgres CLI

```bash
sudo -u postgres psql
```

2. List databases (not neccesarry)

```bash
\l
```

3. Connect to your db

```bash
\c spotmyseat
```

4. Execute your Query

```bash
SELECT * FROM seats;
```

## Test the application

```bash
rails test
```
