# 🚀 Terraform-Powered AWS VPC Architecture

Excited to share a **Terraform-powered AWS VPC Architecture** that I recently worked on! 
![AWS VPC Architecture](https://raw.githubusercontent.com/sureshkumar-devops/Terraform-VPC-SG-RDS-EC2-Dynamically/refs/heads/master/Architecture.png)
This setup provisions a **highly available and secure network infrastructure** using **Infrastructure as Code (IaC)** with Terraform.  

---

## 🔹 Key Highlights

- **VPC (10.0.0.0/16)** spanning multiple Availability Zones (**us-east-1a & us-east-1b**)  
- **Public Subnets (10.0.1.0/24 & 10.0.2.0/24)** hosting Amazon EC2 instances, accessible via **Internet Gateway & Public Route Table**  
- **Private Subnets (10.0.3.0/24 & 10.0.4.0/24)** for backend workloads such as **EC2 and Amazon RDS**, secured with **Private Route Tables**  
- **Security Groups & NACLs** for fine-grained inbound/outbound traffic control  
- **High Availability** achieved by distributing resources across two AZs  

---

## 🌐 Why Terraform?

With **Terraform providers**, the entire infrastructure is:  
✔️ Declaratively defined  
✔️ Version-controlled  
✔️ Repeatable  

This enables faster provisioning, consistency, and scalability.  

---

## 📌 Use Cases

- Building **production-grade workloads**  
- Setting up **CI/CD pipelines**  
- Deploying **cloud-native applications** on AWS  

---

## 🏷️ Tags

#Terraform #AWS #DevOps #CloudComputing #InfrastructureAsCode #VPC #Networking
