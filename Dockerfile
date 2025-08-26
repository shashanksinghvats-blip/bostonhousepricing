# Use a stable Python version
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the whole project
COPY . .

# Default port (Heroku sets $PORT automatically at runtime)
EXPOSE 5000

# Run the app with Gunicorn
# Replace 'app:app' if your entry file/Flask instance is different
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
