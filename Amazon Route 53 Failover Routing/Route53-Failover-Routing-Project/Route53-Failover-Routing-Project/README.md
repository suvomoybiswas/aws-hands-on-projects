\# ☁️ Amazon Route 53 Failover Routing Project



This project demonstrates how to configure \*\*Amazon Route 53 Failover Routing\*\* for a simple two-tier web application running across \*\*two Availability Zones\*\* in AWS.



When the primary web server becomes unavailable, Route 53 automatically fails over traffic to the secondary web server.



---



\## 🏗️ Architecture Overview



The setup includes:

\- \*\*2 Amazon EC2 Instances\*\* (running LAMP stack + Café website)

\- \*\*Amazon Route 53\*\* hosted zone and failover routing records

\- \*\*Route 53 Health Check\*\* with SNS email alert

\- \*\*Failover mechanism\*\* tested by stopping the primary instance



\### Final Architecture Diagram

!\[Architecture Diagram](architecture-diagram.png)



---



\## 🧩 Components



| Component | Description |

|------------|-------------|

| EC2 Instance 1 | Primary web server (AZ1) |

| EC2 Instance 2 | Secondary web server (AZ2) |

| Route 53 Health Check | Monitors `/cafe` endpoint of primary web server |

| SNS Notification | Sends email when primary health check fails |

| Route 53 A Records | Configured for `www` with failover routing (Primary \& Secondary) |



---



\## 🚀 Steps Completed



\### 1️⃣ Confirmed Web Servers

\- Verified both Café web apps running in different AZs (`us-west-2a` \& `us-west-2b`).



\### 2️⃣ Created Health Check

\- Route 53 health check for `CafeInstance1` (primary) monitoring `/cafe` endpoint.

\- SNS topic created for health alerts.

\- Email subscription confirmed.



\### 3️⃣ Configured Route 53 Failover Records

\- \*\*Primary Record (A type)\*\* → Points to `CafeInstance1` IP, attached to health check.  

\- \*\*Secondary Record (A type)\*\* → Points to `CafeInstance2` IP, no health check.



\### 4️⃣ Tested Failover

\- Stopped `CafeInstance1` → Health check turned \*\*Unhealthy\*\*.

\- Route 53 automatically redirected traffic to `CafeInstance2`.

\- Email alert received for health failure.



---



\## 🧾 Verification Results



| Test | Expected Result | Actual Result |

|------|------------------|---------------|

| Primary Healthy | Requests routed to CaféInstance1 | ✅ Success |

| Primary Stopped | Failover to CaféInstance2 | ✅ Success |

| SNS Notification | Received email alert | ✅ Success |



---



\## 🧠 Key Learning Outcomes



\- Understanding of \*\*Route 53 Failover Routing Policies\*\*

\- Use of \*\*Health Checks and SNS integration\*\*

\- DNS-level failover implementation without load balancers



---



\## 🧰 Tools Used



\- AWS EC2  

\- AWS Route 53  

\- AWS SNS  

\- LAMP stack (Linux, Apache, MySQL, PHP)



---



\## 🧑‍💻 Author



\*\*Suvo Biswas\*\*  

📍 Jamaica, New York  

📧 your-email@example.com  

📅 Completed: November 2025



