-- -----------------------------------------------------
-- ENTERPRISE MANAGEMENT SYSTEM
-- Migration: 001_create_core_tables
-- Description: Create initial business schema and tables
-- -----------------------------------------------------


-- 1. CREATE BUSINESS SCHEMA

CREATE SCHEMA business;


-- 2. CREATE ROLES TABLE

CREATE TABLE business.roles (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


-- 3. CREATE USERS TABLE

CREATE TABLE business.users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    role_id BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_users_roles
        FOREIGN KEY (role_id)
        REFERENCES business.roles(id)
        ON DELETE RESTRICT
);


-- 4. CREATE EMPLOYEES TABLE

CREATE TABLE business.employees (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    user_id BIGINT UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    hire_date DATE NOT NULL,
    employment_status VARCHAR(20) NOT NULL DEFAULT 'ACTIVE',
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_employees_users
        FOREIGN KEY (user_id)
        REFERENCES business.users(id)
        ON DELETE SET NULL,

    CONSTRAINT chk_employment_status
        CHECK (employment_status IN ('ACTIVE', 'INACTIVE', 'ON_LEAVE'))
);


-- 5. CREATE CUSTOMERS TABLE

CREATE TABLE business.customers (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- 6. INSERT INITIAL ROLES

INSERT INTO business.roles (name, description)
VALUES
    ('ADMIN', 'System administrator'),
    ('MANAGER', 'Business manager'),
    ('SALES', 'Sales operator'),
    ('WAREHOUSE', 'Inventory operator');


-- -----------------------------------------------------
-- END OF MIGRATION 001
-- -----------------------------------------------------