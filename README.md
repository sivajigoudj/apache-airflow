---

# Apache Airflow on Kubernetes with Prometheus & Grafana

## 📌 Overview

This project demonstrates a **production-style deployment of Apache Airflow on Kubernetes** using **pure Kubernetes YAMLs and Kustomize** (no Helm).
It includes **PostgreSQL as the metadata database** and a **monitoring stack with Prometheus and Grafana**, integrated using **StatsD**.

This repository is designed for **learning Kubernetes deeply** and for **interview-ready real-world experience**.

---

## 🧱 Architecture

### High-Level Flow

```
User
 │
 ▼
Airflow Webserver
 │
 ├── Airflow Scheduler
 │     └── Executes DAGs
 │
 ├── PostgreSQL
 │     └── Stores Airflow metadata
 │
 └── StatsD
       └── Prometheus
             └── Grafana Dashboards
```

### Components

* **Apache Airflow** – Workflow orchestration
* **PostgreSQL** – Airflow metadata database
* **StatsD** – Metrics emitter
* **Prometheus** – Metrics collection
* **Grafana** – Metrics visualization
* **Kustomize** – Kubernetes manifest management

---

## 📁 Repository Structure

```
apache-airflow/
│
├── dags/                         # Airflow DAG definitions
│
├── grafana/                      # Grafana deployment & dashboards
│
├── prometheus/                   # Prometheus configs & deployment
│
├── airflow.cfg                   # Airflow configuration
├── env.properties                # Airflow environment variables
│
├── deployment.yaml               # Airflow Webserver deployment
├── scheduler-deployment.yaml     # Airflow Scheduler deployment
├── service.yaml                  # Airflow Web UI service
│
├── airflow-dags-configmap.yaml   # DAGs ConfigMap
├── airflow-db-init-job.yaml      # Airflow DB initialization job
│
├── postgres-deployment.yaml      # PostgreSQL deployment
├── postgres-service.yaml         # PostgreSQL service
├── postgres-secret.yaml          # PostgreSQL credentials
│
├── statsd-service.yaml           # StatsD service for metrics
│
├── networkpolicy.yaml            # Kubernetes NetworkPolicy
├── poddisruptionbudget.yaml      # Pod Disruption Budget
│
├── kustomization.yaml            # Root Kustomize file
└── README.md
```

---

## 🚀 Deployment Steps

### 1️⃣ Prerequisites

* Kubernetes cluster (Minikube / Kind / EKS / AKS / GKE)
* `kubectl`
* `kustomize` (or kubectl with built-in support)

---

### 2️⃣ Deploy All Components

```bash
kubectl apply -k .
```

---

### 3️⃣ Verify Pods

```bash
kubectl get pods -n airflow
```

Expected pods:

* Airflow Webserver
* Airflow Scheduler
* PostgreSQL
* Prometheus
* Grafana

---

### 4️⃣ Access Airflow UI

```bash
kubectl port-forward svc/airflow-webserver 8080:8080 -n airflow
```

Open:

```
http://localhost:8080
```

---

### 5️⃣ Access Grafana

```bash
kubectl port-forward svc/grafana 3000:3000 -n airflow
```

Open:

```
http://localhost:3000
```

(Default credentials are configured in Grafana manifests.)

---

## 📊 Monitoring & Metrics

* Airflow metrics are emitted via **StatsD**
* Prometheus scrapes StatsD metrics
* Grafana visualizes Airflow performance:

  * DAG run duration
  * Task success / failure
  * Scheduler health
  * Executor metrics

---

## 🔐 Security & Stability

* **Secrets** used for database credentials
* **NetworkPolicy** restricts pod communication
* **PodDisruptionBudget** ensures availability during node disruptions

---

## 🧠 Key Learnings from This Project

* Deploying Airflow without Helm
* Kubernetes Deployments, Services, Jobs, ConfigMaps, Secrets
* StatsD → Prometheus → Grafana integration
* Kustomize-based configuration management
* Production-style Kubernetes layout

## 🔮 Future Enhancements

* Add Prometheus alert rules
* Enable Horizontal Pod Autoscaling
* Use External Secrets / Vault
* Add CI/CD pipeline
* Migrate to Helm for comparison

---

## 👤 Author

**Sivaji Goud**
DevOps Engineer
GitHub: [https://github.com/sivajigoudj](https://github.com/sivajigoudj)

---
