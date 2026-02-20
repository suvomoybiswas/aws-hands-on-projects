\# AWS Lambda Sales Analysis Lab



\## Overview

This repository documents the \*\*AWS Lambda-based serverless computing solution\*\* for generating and emailing daily café sales analysis reports.  

It provides \*\*step-by-step guidance\*\* for deploying, configuring, and testing the solution in AWS.



---



\## 📋 Architecture Summary



\*\*Workflow:\*\*

1\. \*\*CloudWatch Events\*\* triggers the `salesAnalysisReport` Lambda function daily at 8 PM (Mon–Sat).

2\. `salesAnalysisReport` invokes `salesAnalysisReportDataExtractor` to query the café database.

3\. The data extractor function connects to a \*\*MySQL database\*\* hosted on an EC2 LAMP instance.

4\. Query results are sent back to the main function.

5\. The report is formatted and published to an \*\*SNS topic\*\*.

6\. SNS emails the results to the administrator.



---



\## 🧩 Key Components



| AWS Service | Purpose |

|--------------|----------|

| \*\*AWS Lambda\*\* | Serverless compute for data extraction and report generation |

| \*\*Amazon SNS\*\* | Sends the report via email |

| \*\*AWS Systems Manager (Parameter Store)\*\* | Stores DB connection info |

| \*\*Amazon EC2 (LAMP)\*\* | Hosts the MySQL café database |

| \*\*Amazon CloudWatch\*\* | Schedules report generation and provides logs |



---



\## 🛠️ Lab Objectives

\- Recognize necessary IAM policy permissions for Lambda to access AWS resources.

\- Create a Lambda layer for external library dependencies.

\- Create Lambda functions for data extraction and reporting.

\- Deploy and test Lambda functions triggered on a schedule.

\- Use CloudWatch logs for troubleshooting.



---



\## 📁 Lab Tasks

(then include all Task 1–Task 6 sections from your original lab text)



---



\## 📸 Screenshots

Add screenshots of:

\- IAM role trust and permissions

\- Lambda layer creation

\- Function configuration pages

\- Test event results

\- SNS topic and subscription confirmation

\- CloudWatch trigger setup  





---



\## 🧾 License

MIT License © 2025 \*\*Suvo Biswas\*\*



Permission is granted to use, copy, modify, and distribute this documentation for educational or non-commercial purposes.



---



\## ✍️ Author

\*\*Suvo Biswas\*\*  

📍 Jamaica, New York  

🗓️ Created: November 2025



---



\*\*Note:\*\* For educational use only — no actual AWS credentials or proprietary code included.



