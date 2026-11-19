-- Migration: Create product catalog
-- Description: Creates categories and products tables.

CREATE TABLE business.categories (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE business.products (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id BIGINT NOT NULL,
    sku VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price NUMERIC(12,2) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_products_categories
        FOREIGN KEY (category_id)
        REFERENCES business.categories(id)
        ON DELETE RESTRICT,

    CONSTRAINT chk_products_price
        CHECK (price >= 0)
);

CREATE INDEX idx_products_category_id
ON business.products(category_id);

-- Insert initial product categories
INSERT INTO business.categories (name, description)
VALUES
    ('ELECTRONICS', 'Electronic devices and accessories'),
    ('OFFICE', 'Office supplies and equipment'),
    ('FURNITURE', 'Office and commercial furniture'),
    ('CLOTHING', 'Clothing and accessories');

-- Insert initial products
INSERT INTO business.products (category_id, sku, name, description, price)
VALUES
    (1, 'ELEC-001', 'Laptop', 'Business laptop', 2500.00),
    (1, 'ELEC-002', 'Mouse', 'Wireless mouse', 45.50),
    (2, 'OFF-001', 'Notebook', 'Office notebook', 8.90),
    (3, 'FUR-001', 'Office Chair', 'Ergonomic office chair', 450.00);

    