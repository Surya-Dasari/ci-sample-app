# 🚀 CI/CD Sample App – Java + Docker + Kubernetes + Jenkins

This repository contains a simple Java application packaged using **Docker**, deployed on **Kubernetes**, and automated with a **Jenkins CI/CD pipeline**.

---

## 📌 Project Overview

This project demonstrates a complete DevOps workflow:

- Build Java application using **Maven**
- Create Docker image using **Dockerfile**
- Deploy the container on **Kubernetes (Minikube)**
- Automate everything using **Jenkins Pipeline (Jenkinsfile)**

---

## 📂 Repository Structure

```
ci-sample-app/
├── Dockerfile              # Docker image build file
├── Jenkinsfile             # CI/CD pipeline stages for Jenkins
├── k8s/
│   └── deployment.yaml     # Kubernetes Deployment + Service
├── src/                    # Maven source code
├── pom.xml                 # Maven project configuration
└── README.md
```

---

## 🧰 Technologies Used

- Java
- Maven
- Docker
- Kubernetes (Minikube)
- Jenkins Pipeline
- GitHub

---

## 🐳 Docker Instructions

Build Docker image:

```bash
docker build -t ci-sample-app .
```

Run the container:

```bash
docker run -p 8080:8080 ci-sample-app
```

---

## ☸️ Kubernetes Deployment (Minikube)

Apply Kubernetes manifests:

```bash
kubectl apply -f k8s/deployment.yaml
```

View running pods:

```bash
kubectl get pods
```

Access service:

```bash
minikube service ci-sample-app-service
```

---

## 🧪 Jenkins Pipeline (Jenkinsfile)

The CI/CD pipeline includes:

1. Checkout Code
2. Maven Build
3. Docker Build
4. (Optional) Docker Push
5. Deploy to Kubernetes using:

```bash
kubectl apply -f k8s/deployment.yaml
```

Supports Minikube local Docker registry using:

```bash
eval $(minikube docker-env)
```

---

## 📦 Maven Build

Manually build using:

```bash
mvn clean install
```

JAR file will appear in:

```
target/
```

---

## 🤝 Contributing

Feel free to fork the repo and open PRs for improvements.

---

## 📄 License

This project is open-source and free to use.
