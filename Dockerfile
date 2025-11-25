# Use official Python image
FROM python:3.10-slim

# Set work dir
WORKDIR /app

# Copy requirements
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy code
COPY . .

# Expose port (Cloud Run uses 8080)
ENV PORT=8080

# Start the app using gunicorn
CMD ["gunicorn", "-b", ":8080", "main:app"]
