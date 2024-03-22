# docker file for fastapi in production, python 3.11
FROM python:3.10

RUN pip install uvicorn

RUN apt-get update && apt-get install -y libpq-dev sqlite3 gcc

# Set working directory
WORKDIR /app/src

# CREATE .env file in /app
RUN touch /app/.env

# set environment variables
ARG DB_HOST
ARG DB_PORT
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE

# write environment variables to .env file
RUN echo "DB_HOST=$DB_HOST" >> /app/.env
RUN echo "DB_PORT=$DB_PORT" >> /app/.env
RUN echo "DB_USERNAME=$DB_USERNAME" >> /app/.env
RUN echo "DB_PASSWORD=$DB_PASSWORD" >> /app/.env
RUN echo "DB_DATABASE=$DB_DATABASE" >> /app/.env

# set environment variables
ENV DB_HOST=$DB_HOST
ENV DB_PORT=$DB_PORT
ENV DB_USERNAME=$DB_USERNAME
ENV DB_PASSWORD=$DB_PASSWORD
ENV DB_DATABASE=$DB_DATABASE


# Copy the current directory contents into the container at /app
COPY . /app/src

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 8082

# Run app.py when the container launches
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8082"]
