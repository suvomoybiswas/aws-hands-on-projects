# Café Web Application Optimization Lab - Step-by-Step Guide

## Task 1: Connect to the Café Instance via SSH

**macOS/Linux:**
```bash
cd ~/Downloads
chmod 400 labsuser.pem
ssh -i labsuser.pem ec2-user@<CafeInstance Public IP>
Windows: Use PuTTY with the labsuser.ppk key.

Task 2: Configure AWS CLI
Discover region:

bash
Copy code
curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region
Configure AWS CLI:

bash
Copy code
aws configure
# Provide Access Key ID, Secret Access Key, Default Region, Output format=json
Task 3: Uninstall MariaDB and Stop Local Database
bash
Copy code
sudo systemctl stop mariadb
sudo yum -y remove mariadb-server
Task 4: Determine Café Instance ID
bash
Copy code
aws ec2 describe-instances \
--filters "Name=tag:Name,Values=CafeInstance" \
--query "Reservations[*].Instances[*].InstanceId" \
--output text
Task 5: Stop, Resize, and Restart the EC2 Instance
Stop instance:

bash
Copy code
aws ec2 stop-instances --instance-ids <CafeInstance Instance ID>
Resize instance to t3.micro:

bash
Copy code
aws ec2 modify-instance-attribute \
--instance-id <CafeInstance Instance ID> \
--instance-type "{\"Value\": \"t3.micro\"}"
Start instance:

bash
Copy code
aws ec2 start-instances --instance-ids <CafeInstance Instance ID>
Check status and record DNS/IP:

bash
Copy code
aws ec2 describe-instances \
--instance-ids <CafeInstance Instance ID> \
--query "Reservations[*].Instances[*].[InstanceType,PublicDnsName,PublicIpAddress,State.Name]" \
--output table
Task 6: Test the Café Website
Open a browser and navigate to:

pgsql
Copy code
http://<Downsized CafeInstance Public DNS Name>/cafe
Verify that the website works correctly.

Task 7: Estimate Costs Using AWS Pricing Calculator
Open AWS Pricing Calculator

Before optimization:

EC2: t3.small, 40 GB EBS

RDS: db.t3.micro, 20 GB storage

After optimization:

EC2: t3.micro, 20 GB EBS

RDS remains the same

Export CSV files and record estimated monthly costs.

yaml
Copy code

---

### **screenshots/README.md** (checklist of required screenshots)

```markdown
# Screenshot Checklist

For submission, please include the following screenshots in the `screenshots/` folder:

1. **SSH Login Screens**
   - SSH session to CafeInstance
   - SSH session to CLI Host

2. **AWS CLI Configuration**
   - Output of `aws configure`

3. **MariaDB Uninstallation**
   - Confirmation of MariaDB removal

4. **Café Instance Operations**
   - Instance ID of CafeInstance
   - Stop instance command output
   - Modify instance type command output (if any)
   - Start instance command output
   - Instance status after restart (with InstanceType, Public DNS, Public IP, and State.Name)

5. **Café Website Functionality**
   - Screenshot of the website running in a browser after optimization

6. **AWS Pricing Calculator**
   - Cost estimate before optimization
   - Cost estimate after optimization