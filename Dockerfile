FROM python:3.12-slim

# set env
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# dependencies OS (postgres client, dll)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# install python deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# copy project
COPY app/ .

# collectstatic & migrate akan dilakukan via docker compose command, bukan di sini

# default command = gunicorn
CMD ["gunicorn", "smpia_portal.wsgi:application", "--bind", "0.0.0.0:8000"]