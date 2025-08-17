# 🚀 Terraform-Powered AWS VPC Architecture

Excited to share a **Terraform-powered AWS VPC Architecture** that I recently worked on! 
![AWS VPC Architecture](https://raw.githubusercontent.com/sureshkumar-devops/Terraform-VPC-SG-RDS-EC2-Dynamically/refs/heads/master/Architecture.png)
This setup provisions a **highly available and secure network infrastructure** using **Infrastructure as Code (IaC)** with Terraform.  

---
This project provisions a **modular AWS Infrastructure** using Terraform.  
It creates a secure VPC with public/private subnets, route tables, security groups, EC2 instances, and an RDS database.  
## 📂 Project Structure  

---

## 🛠️ Modules Overview  

### 1️⃣ **VPC Module**
- Creates **VPC**  
- Attaches **Internet Gateway**  

### 2️⃣ **Subnet Module**
- Creates **Public & Private Subnets** in multiple AZs  

### 3️⃣ **Route Table Module**
- Associates Public Subnets → **Internet Gateway**  
- Associates Private Subnets → **NAT Gateway** or no IGW  

### 4️⃣ **Security Group Module**
- Creates:
  - **Public EC2 SG** → Allow SSH/HTTP  
  - **Private EC2 SG** → Internal access  
  - **RDS SG** → Allow DB traffic from Private EC2  

### 5️⃣ **EC2 Module**
- Launches EC2 instances:
  - Public Subnet → Bastion/Web server  
  - Private Subnet → App server  

### 6️⃣ **RDS Module**
- Launches RDS Database inside **Private Subnet**  
- Secured with RDS Security Group  

---

## ⚙️ Usage  

1. Clone the repo  
   ```bash
   git clone https://github.com/sureshkumar-devops/Terraform-VPC-SG-RDS-EC2-Dynamically.git
   cd project
   
2. Initialize Terraform
   terraform init
   
3. Validate configuration
   terraform validate   

4. Plan the deployment  
   terraform plan -var-file="terraform.tfvars"

5. Apply changes 
   terraform apply -var-file="terraform.tfvars" -auto-approve
   
6. Destroy resources 
   terraform destroy -var-file="terraform.tfvars" -auto-approve
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
