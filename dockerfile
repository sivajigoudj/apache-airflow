FROM apache/airflow:2.8.4-python3.10

USER root
RUN apt-get update && apt-get install -y \
    gcc \
    curl \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

USER airflow

# 🔥 REMOVE preinstalled airflow completely
RUN pip uninstall -y apache-airflow

# 🔥 REINSTALL airflow WITH statsd extra
RUN pip install --no-cache-dir apache-airflow[statsd]==2.8.4

# Providers (after airflow install)
RUN pip install --no-cache-dir \
    apache-airflow-providers-amazon \
    psycopg2-binary
