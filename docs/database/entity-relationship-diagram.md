# Entity Relationship Diagram (ERD)

## Enterprise Management System

```mermaid
erDiagram

    ROLES ||--o{ USERS : assigns
    USERS ||--o| EMPLOYEES : belongs_to
    CUSTOMERS ||--o{ SALES : makes
    EMPLOYEES ||--o{ SALES : processes

    CATEGORIES ||--o{ PRODUCTS : contains

    PRODUCTS ||--o{ INVENTORY_MOVEMENTS : generates
    USERS ||--o{ INVENTORY_MOVEMENTS : records

    SALES ||--|{ SALE_ITEMS : contains
    PRODUCTS ||--o{ SALE_ITEMS : included_in

    SALES ||--o{ PAYMENTS : receives

    ROLES {
        int id PK
        string name
        string description
    }

    USERS {
        int id PK
        int role_id FK
        string email
        string password_hash
        boolean is_active
    }

    EMPLOYEES {
        int id PK
        int user_id FK
        string first_name
        string last_name
        string phone
        date hire_date
    }

    CUSTOMERS {
        int id PK
        string first_name
        string last_name
        string email
        string phone
    }

    CATEGORIES {
        int id PK
        string name
        string description
    }

    PRODUCTS {
        int id PK
        int category_id FK
        string name
        string description
        decimal price
        boolean is_active
    }

    INVENTORY_MOVEMENTS {
        int id PK
        int product_id FK
        int user_id FK
        string movement_type
        int quantity
        string reason
        datetime created_at
    }

    SALES {
        int id PK
        int customer_id FK
        int employee_id FK
        decimal total
        string status
        datetime sale_date
    }

    SALE_ITEMS {
        int id PK
        int sale_id FK
        int product_id FK
        int quantity
        decimal unit_price
        decimal subtotal
    }

    PAYMENTS {
        int id PK
        int sale_id FK
        decimal amount
        string payment_method
        datetime payment_date
    }