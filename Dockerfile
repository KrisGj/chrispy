# Use an official Python runtime as a parent image
FROM python:3.11.4-slim-bullseye

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Poetry
RUN pip install --no-cache-dir poetry

# Install project dependencies
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable for Flask
ENV FLASK_APP=app/__init__.py

# Run app.py when the container launches
CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]
