FROM postgres:latest

# Set environment variables for PostgreSQL
ENV POSTGRES_DB=mydatabase
ENV POSTGRES_USER=test
ENV POSTGRES_PASSWORD=newpassword

# Copy the SQL script into the container
COPY init.sql /docker-entrypoint-initdb.d/

# Add documentation
LABEL description="PostgreSQL Dockerfile for mydatabase"
