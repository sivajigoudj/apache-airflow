FROM apache/airflow:2.8.4-python3.10

USER root

# Install OS packages (Debian 12 compatible)
RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    vim \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# Install Python packages
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Enable StatsD metrics
ENV AIRFLOW__METRICS__STATSD_ON=True
ENV AIRFLOW__METRICS__STATSD_HOST=statsd
ENV AIRFLOW__METRICS__STATSD_PORT=8125
ENV AIRFLOW__METRICS__STATSD_PREFIX=airflow
