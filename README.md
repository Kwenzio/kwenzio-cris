# Kwenzio CRIS

A Rails 8 application. This README covers getting a local development environment running and will be expanded as the project grows.

## Requirements

- Ruby **4.0.3** (see `.ruby-version`)
- PostgreSQL (running on `localhost:5432`)
- Bundler

## Getting started

### 1. Clone the repository

```sh
git clone https://github.com/Kwenzio/kwenzio-cris.git
cd kwenzio-cris
```

### 2. Create the PostgreSQL role

The app connects as the `rails_local` user (see `config/database.yml`). Create it once or change to your local user:

```sh
sudo -u postgres createuser --createdb --pwprompt rails_local
```

### 3. Set environment variables

Create a `.env` file in the project root from `.env.example`

```sh
cp .env.example .env
```

### 4. Install dependencies and set up the database

```sh
bin/setup
```

This installs gems, creates and migrates the `cris_dev` and `cris_test` databases, clears logs/tmp files, and starts the server. Use `bin/setup --skip-server` to skip starting the server.

### 5. Run the app

```sh
bin/dev
```

Then visit <http://localhost:3000>.

## Running tests and checks

```sh
bin/rails test     # run the test suite
bin/rubocop        # lint Ruby code
bin/brakeman       # security static analysis
bin/ci             # run the full CI pipeline locally (setup, lint, audits, tests)
```

## Project notes

Architecture and tooling decisions are recorded in [`docs/decisions.md`](docs/decisions.md).
