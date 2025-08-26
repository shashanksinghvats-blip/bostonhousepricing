# Use a stable Python version
FROM python:3.10-slim

# Set working directory
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt

# Expose port (Heroku sets PORT env variable automatically)
EXPOSE $PORT

# Start Gunicorn server
CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app