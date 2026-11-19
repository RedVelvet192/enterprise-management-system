# System Architecture

## 1. Project Overview

Enterprise Management System is a modular
full-stack application designed to manage
business operations.

## 2. Architectural Style

The application follows a Modular Monolith
Architecture.

## 3. Main Components

### Frontend
- React
- TypeScript
- Tailwind CSS

### Backend
- Python
- FastAPI
- SQLAlchemy

### Database
- PostgreSQL

### Infrastructure
- Docker
- GitHub Actions
- AWS (planned)

## 4. Functional Modules

- Authentication
- Users
- Employees
- Customers
- Products
- Inventory
- Sales

## 5. Communication

The frontend communicates with the backend
through REST APIs using HTTP/HTTPS.

The backend manages business logic and
communicates with PostgreSQL through
SQLAlchemy.

## 6. Scalability

The modular architecture allows the system
to evolve while maintaining separation
of responsibilities.

## 7. Project Status

Architecture design in progress.