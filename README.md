# 🧭 Upcommerce2 — Automated Monitoring & Self-Healing on Kubernetes

**Upcommerce2** is an infrastructure reliability project that demonstrates how Site Reliability Engineering (SRE) principles — *automation, observability, and resilience* — can be applied in Kubernetes environments.

It automates pod health monitoring, implements self-healing behavior, and integrates with Prometheus and alerting mechanisms (Slack/Gmail) for proactive incident response.

---

## 🚀 Overview

In large-scale systems, manual intervention to restart failing pods or scale down unhealthy workloads can be slow and error-prone.
Upcommerce2 automates this process through a **Watcher Script**, **Kubernetes objects**, and **Prometheus alerting**, forming an end-to-end self-healing and monitoring pipeline.

### Core Features

* 🐚 **Pod Health Watcher:** A Bash script that detects pod restarts and triggers scale-down or alert actions.
* 🐳 **Dockerized App:** Python-based web service containerized and deployed on Kubernetes.
* ⚙️ **Kubernetes Manifests:** `deployment.yml`, `service.yml`, and related files for running the app.
* 📈 **Monitoring Stack:** `prometheus.yml` configuration for metrics scraping.
* 🔔 **Alerting:** Slack or Gmail integration via `alertmanager.yml`.
* ♻️ **Self-Healing:** Automatically scales affected deployments and restores availability.

---

## 🧩 Technologies Used

| Category         | Tools                             |
| ---------------- | --------------------------------- |
| Language         | Python, Bash                      |
| Infrastructure   | Docker, Kubernetes                |
| Monitoring       | Prometheus, Alertmanager          |
| Version Control  | Git & GitHub                      |
| CI/CD (optional) | GitHub Actions / Jenkins (future) |
| Cloud (optional) | Minikube / EKS / GKE              |

---

## 🏗️ Project Architecture

```
            ┌────────────────────────┐
            │   Python App (Pod)     │
            └───────────┬────────────┘
                        │
          Logs & Metrics│
                        ▼
                ┌──────────────┐
                │ Prometheus   │
                └──────┬───────┘
                       │Alerts
                       ▼
                ┌──────────────┐
                │ Alertmanager │
                └──────┬───────┘
                       │Notifications
                       ▼
         ┌───────────────────────────┐
         │ Slack / Gmail Integrations│
         └───────────────────────────┘
                       ▲
                       │Triggered Actions
                ┌──────┴──────┐
                │ watcher.sh   │
                └──────────────┘
```

---

## ⚙️ Setup & Deployment

### Prerequisites

* Docker installed and running
* Kubernetes cluster (e.g., Minikube or cloud-managed)
* kubectl configured
* Prometheus deployed (optional for monitoring)

### Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/DebbieArita/Upcommerce2.git
   cd Upcommerce2
   ```

2. **Build and Run the Docker Image**

   ```bash
   docker build -t upcommerce2-app .
   kubectl apply -f deployment.yml
   kubectl apply -f service.yml
   ```

3. **Deploy Monitoring Components**

   ```bash
   kubectl apply -f prometheus.yml
   kubectl apply -f alertmanager.yml
   ```

4. **Run the Watcher**

   ```bash
   chmod +x watcher.sh
   ./watcher.sh
   ```

5. **Access the App**

   ```bash
   minikube service upcommerce2-service
   ```

---

## 📊 Monitoring and Alerting

* **Prometheus** scrapes metrics from the application pods.
* **Alertmanager** sends alerts via configured channels (e.g., Slack, Gmail).
* **Watcher Script** acts upon alerts to scale deployments automatically.

---

## 🧠 Future Improvements

| Category      | Suggested Improvement                       | Description                                               |
| ------------- | ------------------------------------------- | --------------------------------------------------------- |
| CI/CD         | Add GitHub Actions workflow                 | Automate build, test, and deploy pipeline                 |
| Observability | Integrate Grafana                           | Visualize metrics and alerts on dashboards                |
| Resilience    | Implement retry logic in watcher.sh         | Prevent false positives in transient failures             |
| Testing       | Add unit and integration tests              | Validate app and script functionality                     |
| Secrets       | Use Kubernetes Secrets or Vault             | Secure Slack/Gmail credentials                            |
| Scalability   | Add Helm chart                              | Simplify parameterized deployments                        |
| Documentation | Add Architecture Diagram (PlantUML/Mermaid) | Improve understanding of relationships between components |
| Logging       | Integrate Loki or ELK Stack                 | Centralize logs for better traceability                   |

---


