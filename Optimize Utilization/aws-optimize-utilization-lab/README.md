# Café Web Application Optimization Lab

## Overview
In this lab, you optimized the AWS resources used to run the Café web application. The goal was to reduce costs by resizing the EC2 instance and uninstalling the decommissioned local database after migrating the database to Amazon RDS.

The lab included connecting to EC2 instances via SSH, using the AWS CLI to manage instances, and using the AWS Pricing Calculator to estimate cost savings.

---

## Objectives
By completing this lab, you will be able to:

1. Optimize an Amazon EC2 instance to reduce costs.
2. Use the AWS CLI to manage EC2 instances.
3. Estimate AWS service costs using the AWS Pricing Calculator.
4. Validate functionality of an application after resource optimization.

---

## Business Case
The Café web application initially hosted its database locally on an EC2 instance. After migrating the database to Amazon RDS:

- The local database on the EC2 instance became redundant.
- The EC2 instance was larger than necessary, leading to higher costs.
- Reducing instance size and storage can save costs without impacting application performance.

Optimizing these resources aligns with business goals to minimize cloud expenditures while maintaining operational efficiency.
