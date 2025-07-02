CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(256) NOT NULL,
  name VARCHAR(128),
  instrument VARCHAR(64),
  oauth_provider VARCHAR(64),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE events (
  id SERIAL PRIMARY KEY,
  title VARCHAR(128),
  description TEXT,
  location VARCHAR(128),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  created_by INTEGER REFERENCES users(id),
  created_at TIMESTAMP DEFAULT now()
);

CREATE TABLE event_members (
  id SERIAL PRIMARY KEY,
  event_id INTEGER REFERENCES events(id),
  user_id INTEGER REFERENCES users(id),
  status VARCHAR(24),
  responded_at TIMESTAMP
);

CREATE TABLE notifications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  event_id INTEGER REFERENCES events(id),
  type VARCHAR(32),
  status VARCHAR(24),
  sent_at TIMESTAMP
);
