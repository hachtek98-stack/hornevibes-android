-- Schema for Hornevibes Database

-- Define Tables
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    post_id INT REFERENCES posts(id),
    user_id INT REFERENCES users(id),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Define Indexes
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_posts_user_id ON posts(user_id);
CREATE INDEX idx_comments_post_id ON comments(post_id);

-- Define Policies
-- Users should be able to select their own posts
CREATE POLICY select_own_posts ON posts
FOR SELECT
TO users
USING (user_id = auth.uid());

-- Users should be able to insert their own posts
CREATE POLICY insert_own_posts ON posts
FOR INSERT
TO users
WITH CHECK (user_id = auth.uid());

-- Users should be able to select their own comments
CREATE POLICY select_own_comments ON comments
FOR SELECT
TO users
USING (user_id = auth.uid());

-- Users should be able to insert their own comments
CREATE POLICY insert_own_comments ON comments
FOR INSERT
TO users
WITH CHECK (user_id = auth.uid());

-- End of SQL script