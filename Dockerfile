# Use Python 3.10
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Create venv
RUN python -m venv /opt/venv

# Tell Docker to use venv
ENV PATH="/opt/venv/bin:$PATH"

# Copy requirements first
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the entire project
COPY . .

# Run your bot
CMD ["python", "main.py"]
