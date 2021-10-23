# README

## System dependencies
- Ruby 3.0
- Rails 6.1.4.1
- nodejs
- yarn

## Installation
```bash
bundle install
```

## Configuration

Es muss eine `.env` Datei angelegt werden mit diesen Variablen:
```
LASTFM_APIKEY=DEMO
LASTFM_USERNAME=DEMO
```

## Database initialization

```bash
bundle exec rake db:migrate
```
```bash
bundle exec rake db:seed
```

Bitte den default Benutzer ändern!

**User:** admin@example.com
**Passwort:** password

## Run Development Version

```bash
bundle exec rails s
```

## Run Production Version

```bash
bundle exec rake db:migrate RAILS_ENV=production
```

```bash
bundle exec rails s -e production
```
