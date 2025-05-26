# Use official slim Python image
FROM python:3.13.3-slim-bullseye

# Set Poetry version
ENV FLASK_APP=web:app
ENV POETRY_VERSION=2.1.1

# Set working directory
WORKDIR /usr/src/app

# Install Poetry
RUN pip install "poetry==$POETRY_VERSION" --no-cache-dir && \
    poetry config virtualenvs.create false && \
    poetry config installer.max-workers 1

# Copy dependency files first (enables layer caching)
COPY pyproject.toml poetry.lock ./

# Install dependencies (no dev, no cache, no root package install)
RUN poetry install --no-interaction --no-root --no-ansi --no-cache

# Copy the full app source
COPY . .

# Expose port
EXPOSE 80

# Define the default command
CMD ["gunicorn", "-b", "0.0.0.0:80", "web:app"]
