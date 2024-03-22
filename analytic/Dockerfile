# docker file for fastapi in production, python 3.11
FROM python:3.10

RUN pip install uvicorn

RUN apt-get update && apt-get install -y libpq-dev sqlite3 gcc

# Set working directory
WORKDIR /app/src

# CREATE .env file in /app
RUN touch /app/.env

RUN echo "DB_HOST=" >> /app/.env
RUN echo "DB_PORT=" >> /app/.env
RUN echo "DB_USERNAME=" >> /app/.env
RUN echo "DB_PASSWORD=" >> /app/.env
RUN echo "DB_DATABASE=" >> /app/.env

# Copy the current directory contents into the container at /app
COPY . /app/src

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 8082

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8082"]
