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

## Initialize Database

1. Download postgres in your workspace
2. Edit the [database.yml](./config/database.yml) to configure your specific user or database if a diffrent configuration is wanted.
3. To create the Database run:

```bash
rails db:create
```

Depending on your Ruby on Rails installation this might not work for you and you have to create a new database with psql or PgAdmin depending on your preference.

4. To migrate the database with the existing [schema.rb](./db/schema.rb) run:

```bash
rails db:migrate
```

Now the database and tables should be automatically initialized and you can start the app.

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
