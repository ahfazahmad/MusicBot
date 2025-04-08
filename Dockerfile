# Use Python base image
FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y gcc libffi-dev

# Set working directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Upgrade pip
RUN pip install --upgrade pip

# Install Python packages
RUN pip install -r requirements.txt

# Now copy your app code
COPY . .

# Default command
CMD ["python", "bot.py"]
