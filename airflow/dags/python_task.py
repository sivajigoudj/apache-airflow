from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def print_message():
    print("This is a Python task")

with DAG(
    dag_id="python_task_example",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@hourly",
    catchup=False,
) as dag:

    python_task = PythonOperator(
        task_id="print_message",
        python_callable=print_message
    )
