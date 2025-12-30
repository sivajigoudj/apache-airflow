from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="simple_test_dag",
    start_date=datetime(2024, 1, 1),
    schedule_interval="@once",
    catchup=False,
) as dag:

    hello = BashOperator(
        task_id="hello_world",
        bash_command="echo Hello from ConfigMap DAG",
    )
