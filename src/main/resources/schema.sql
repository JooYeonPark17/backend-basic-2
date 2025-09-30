-- H2 Database Schema for Lunch Management System

-- Create Team table
CREATE TABLE team (
    id BIGINT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

-- Create User table
CREATE TABLE "user" (
    id BIGINT NOT NULL AUTO_INCREMENT,
    user_id VARCHAR(255) NOT NULL UNIQUE,
    role VARCHAR(255),
    name VARCHAR(255),
    team_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

-- Create Lunch Round table
CREATE TABLE lunch_round (
    id BIGINT NOT NULL AUTO_INCREMENT,
    date DATE,
    status VARCHAR(255),
    team_id BIGINT,
    creator_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

-- Create Menu Option table
CREATE TABLE menu_option (
    id BIGINT NOT NULL AUTO_INCREMENT,
    menu VARCHAR(255),
    type VARCHAR(255),
    price INTEGER,
    round_id BIGINT,
    PRIMARY KEY (id),
    FOREIGN KEY (round_id) REFERENCES lunch_round(id)
);

-- Sample data insertion (optional)
INSERT INTO team (name) VALUES
    ('Development Team'),
    ('QA Team'),
    ('Marketing Team');

INSERT INTO "user" (user_id, role, name, team_id) VALUES
    ('dev001', 'ADMIN', 'John Doe', 1),
    ('dev002', 'USER', 'Jane Smith', 1),
    ('qa001', 'USER', 'Bob Johnson', 2),
    ('mkt001', 'USER', 'Alice Brown', 3);

INSERT INTO lunch_round (date, status, team_id, creator_id) VALUES
    ('2024-01-15', 'ACTIVE', 1, 1),
    ('2024-01-16', 'COMPLETED', 2, 3);

INSERT INTO menu_option (menu, type, price, round_id) VALUES
    ('비빔밥', 'KOREAN', 8000, 1),
    ('치킨', 'WESTERN', 15000, 1),
    ('초밥', 'JAPANESE', 12000, 2),
    ('파스타', 'WESTERN', 10000, 2);