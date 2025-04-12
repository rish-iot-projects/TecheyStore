# TecheyStore
Consists of an Electronic Component Store
A web application for selling electronic components, built with Angular, Node.js, PostgreSQL, Kafka, and Docker.

## Features
- Browse and order electronic components.
- Angular frontend with routing.
- Node.js/Express backend with PostgreSQL database.
- Kafka for asynchronous order processing.
- Dockerized services for easy deployment.
- Mock external API for additional electronics data.

## Setup
1. Install Docker and Docker Compose.
2. Run `docker-compose up --build` to start all services.
3. Access the frontend at `http://localhost:4200`.
4. Backend API is available at `http://localhost:3000`.

## Services
- **Frontend**: Angular app on port 4200.
- **Backend**: Node.js/Express API on port 3000.
- **Database**: PostgreSQL on port 5432.
- **Kafka**: Messaging on port 9092.
- **Zookeeper**: Kafka dependency on port 2181.

## Database
The `products` table contains electronic components (resistors, capacitors, microcontrollers, etc.). Orders are stored in the `orders` table.

## Running
- Use `docker-compose down` to stop services.
- Modify `server/db.sql` to update the component list.
- Run `npm install` in `server/` and `client/` if making local changes.
