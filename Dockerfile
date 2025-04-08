FROM python:3.10-slim

WORKDIR /app

# Install ffmpeg, gcc, and libc-dev (for building packages like pytgcalls)
RUN apt update && apt install -y ffmpeg gcc libc-dev

# Create a virtual environment
RUN python -m venv /opt/venv

# Activate the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Copy requirements first
COPY requirements.txt .

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of your project
COPY . .

# Start your app
CMD ["python", "main.py"]
