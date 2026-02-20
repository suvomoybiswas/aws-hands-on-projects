# AWS EC2 Lab: Bastion Host and Web Server Deployment

This lab demonstrates launching an EC2 bastion host and a web server using **AWS Management Console** and **AWS CLI**.

## 🧭 Overview

- Launch a bastion host EC2 instance (Amazon Linux 2) via Console
- Connect to bastion host via EC2 Instance Connect
- Launch a web server EC2 instance using AWS CLI with user data script
- Deploy the Café & Bakery static website on the web server

## ⚙️ Lab Tasks

### 1. Launching EC2 Instance via Console
- Name: Bastion host
- AMI: Amazon Linux 2 (HVM)
- Instance type: t3.micro
- Key pair: Proceed without key pair
- Network: Lab VPC, Public Subnet, Auto-assign public IP enabled
- Security group: Bastion security group (permit SSH)
- Storage: default 8 GiB
- IAM Role: Bastion-Role
- Launch instance and note its ID

### 2. Logging in to Bastion Host
- Use EC2 Instance Connect to connect to Bastion host
- You now have CLI access to launch the web server

### 3. Retrieve the latest AMI
```bash
AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
export AWS_DEFAULT_REGION=${AZ::-1}
AMI=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
--query 'Parameters[0].[Value]' --output text)
echo $AMI
4. Retrieve the Public Subnet ID
bash
Copy code
SUBNET=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=Public Subnet" \
--query Subnets[].SubnetId --output text)
echo $SUBNET
5. Retrieve the Web Security Group
bash
Copy code
SG=$(aws ec2 describe-security-groups --filters "Name=group-name,Values=WebSecurityGroup" \
--query SecurityGroups[].GroupId --output text)
echo $SG
6. Download User Data Script
bash
Copy code
wget https://aws-tc-largeobjects.s3.us-west-2.amazonaws.com/CUR-TF-100-RSJAWS-1-23732/171-lab-JAWS-create-ec2/s3/UserData.txt
cat UserData.txt
7. Launch Web Server via CLI
Run launch-webserver.sh (provided in this project)

Script retrieves AMI, Subnet, SG, and launches EC2 instance

Tags instance as "Web Server"

8. Wait for Instance to be Ready
The script automatically waits until the instance state is running

9. Test Web Server
Public DNS is displayed by the script after launch

Open in browser to confirm Café & Bakery site is deployed

📷 Screenshots
Save your screenshots in screenshots/ folder with names:

01_Launch_EC2_Console.png

02_Connect_Bastion.png

03_Retrieve_AMI.png

04_Retrieve_Subnet.png

05_Retrieve_SG.png

06_Download_UserData.png

07_Launch_Instance.png

08_Wait_Instance.png

09_Test_WebServer.png

✅ Conclusion
Bastion host and web server successfully launched

Café & Bakery website deployed via CLI and user data script