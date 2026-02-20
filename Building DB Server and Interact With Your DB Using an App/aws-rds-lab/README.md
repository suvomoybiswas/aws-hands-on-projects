# AWS RDS Lab Project

This project contains the step-by-step instructions and screenshots for the AWS lab: 
**Build Your DB Server and Interact With Your DB Using an App**.

## Lab Objectives

- Launch an Amazon RDS DB instance with high availability.
- Configure the DB instance to permit connections from a web server.
- Open a web application and interact with your database.

## Lab Steps with Screenshots

### 1. Create a Security Group for the RDS DB Instance
![Create Security Group](screenshots/create-security-group.png)

- Navigate to **VPC > Security Groups**.
- Click **Create security group**.
- Name: `DB Security Group`
- Description: `Permit access from Web Security Group`
- VPC: `Lab VPC`
- Add inbound rule: MySQL/Aurora (3306) from **Web Security Group**
- Click **Create security group**

---

### 2. Create a DB Subnet Group
![Create DB Subnet Group](screenshots/create-db-subnet-group.png)

- Navigate to **RDS > Subnet groups**.
- Click **Create DB Subnet Group**
- Name: `DB Subnet Group`
- VPC: `Lab VPC`
- Add subnets:
  - 10.0.1.0/24 in first AZ
  - 10.0.3.0/24 in second AZ
- Click **Create**

---

### 3. Create an Amazon RDS DB Instance
![Create RDS Instance](screenshots/create-rds-instance.png)

- Navigate to **RDS > Databases > Create Database**
- Engine: MySQL, Template: Dev/Test, Multi-AZ
- DB instance identifier: `lab-db`
- Master username/password: `main` / `lab-password`
- DB instance class: `db.t3.medium`
- Storage: General Purpose (SSD)
- Security group: `DB Security Group`
- Initial database name: `lab`
- Disable automated backups
- Click **Create database**
- Copy the **Endpoint** for later use

---

### 4. Interact with Your Database
![Interact with DB](screenshots/interact-with-db.png)

- Open the web application using the WebServer IP.
- Click the **RDS** link at the top.
- Enter database credentials:
  - Endpoint: `<RDS Endpoint>`
  - Database: `lab`
  - Username: `main`
  - Password: `lab-password`
- Click **Submit**
- The web app shows an **Address Book** connected to the RDS database.
- Test adding, editing, and removing contacts.

---

## Author
Suvo Biswas

## License
MIT License
