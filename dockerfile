# Use an official Python runtime as a parent image 
FROM python:3.10-slim

# Set environment variables 
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install Git
RUN apt-get update && apt-get install -y git

# Set the working directory in the container 
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt .

# Install requirements from the requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the application will listen on 
EXPOSE 80
EXPOSE 443

# Start the Web UI
CMD ["lida", "ui", "--host", "0.0.0.0", "--port", "80"]
