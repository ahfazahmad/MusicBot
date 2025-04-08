# Use official Python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Install system dependencies
RUN apt update && apt install -y ffmpeg

# Create virtual environment
RUN python -m venv /opt/venv

# Activate virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Copy requirements first
COPY requirements.txt .

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Now copy your entire project
COPY . .

# Set command to run your app
CMD ["python", "main.py"]
