# Start by building the application
FROM python:3.10-slim as builder

# Set the working directory in the Docker image
WORKDIR /usr/src/app

# Copy pyproject.toml and poetry.lock files
COPY pyproject.toml poetry.lock* ./

# Install poetry in the image
RUN pip install poetry

# Disable virtualenvs created by poetry
RUN poetry config virtualenvs.create false

# Install project dependencies
RUN poetry install --no-dev --no-interaction --no-ansi

# Copy the rest of the code
COPY secretsauce/ .

# Final stage: Create the final image
FROM python:3.10-slim

# Copy the Python environment from the builder image
COPY --from=builder /usr/local /usr/local
COPY --from=builder /usr/src/app /usr/src/app

# Set the working directory in the container
WORKDIR /usr/src/app

# Expose the port the app runs on
EXPOSE 8000

# Run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]