from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(
    dag_id="two_tasks_example",
    start_date=datetime(2024, 1, 1),
    schedule_interval=None,
    catchup=False,
) as dag:

    task_1 = BashOperator(
        task_id="task_1",
        bash_command="echo 'Task 1 running'"
    )

    task_2 = BashOperator(
        task_id="task_2",
        bash_command="echo 'Task 2 running'"
    )

    task_1 >> task_2
