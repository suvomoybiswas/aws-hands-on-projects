
---

### **2. launch-webserver.sh**

```bash
#!/bin/bash

# Set the Availability Zone and Region
AZ=$(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)
export AWS_DEFAULT_REGION=${AZ::-1}

# Retrieve latest Amazon Linux 2 AMI
AMI=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 \
--query 'Parameters[0].[Value]' --output text)
echo "AMI ID: $AMI"

# Retrieve Public Subnet ID
SUBNET=$(aws ec2 describe-subnets --filters "Name=tag:Name,Values=Public Subnet" \
--query Subnets[].SubnetId --output text)
echo "Subnet ID: $SUBNET"

# Retrieve Security Group ID
SG=$(aws ec2 describe-security-groups --filters "Name=group-name,Values=WebSecurityGroup" \
--query SecurityGroups[].GroupId --output text)
echo "Security Group ID: $SG"

# Launch the web server instance
INSTANCE=$(aws ec2 run-instances \
--image-id $AMI \
--subnet-id $SUBNET \
--security-group-ids $SG \
--user-data file://./userdata/UserData.txt \
--instance-type t3.micro \
--tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=Web Server}]' \
--query 'Instances[*].InstanceId' --output text)
echo "Launched Instance ID: $INSTANCE"

# Wait until the instance is running
aws ec2 wait instance-running --instance-ids $INSTANCE
echo "Instance is running."

# Get the public DNS
PUBLIC_DNS=$(aws ec2 describe-instances \
--instance-ids $INSTANCE \
--query 'Reservations[].Instances[].PublicDnsName' --output text)
echo "Web server URL: http://$PUBLIC_DNS"
