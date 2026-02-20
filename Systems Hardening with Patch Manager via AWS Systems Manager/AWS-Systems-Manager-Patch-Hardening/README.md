# 🛡️ Systems Hardening with AWS Systems Manager Patch Manager

## 📖 Overview
This project demonstrates **Systems Hardening** by automating the patching process of Linux and Windows EC2 instances using **AWS Systems Manager Patch Manager**.

In large-scale environments, maintaining up-to-date OS and application patches is critical for security. This lab focuses on:
- Using **default patch baselines** for Linux instances
- Creating **custom patch baselines** for Windows
- Managing patch groups with **tags**
- Verifying **patch compliance** across instances

---

## 🎯 Objectives

✅ Patch Linux instances using default baseline  
✅ Create a custom patch baseline for Windows  
✅ Use patch groups to patch Windows instances  
✅ Verify patch compliance  

---

## 🕒 Duration
Approx. **60 minutes**

---

## 🧩 Lab Environment
- **3 Linux EC2 instances**
- **3 Windows EC2 instances**
- IAM roles and backend components preconfigured
- Managed via **AWS Systems Manager (SSM)**

---

## 🧠 Tasks Summary
| Task | Description |
|------|--------------|
| Task 1 | Patch Linux instances using AWS default baseline |
| Task 2 | Create a custom patch baseline for Windows |
| Task 3 | Tag and patch Windows instances |
| Task 4 | Verify compliance and review patch status |

---

## 📂 Documentation
Each major task has its own documentation:

- [`01-patch-linux.md`](./docs/01-patch-linux.md)
- [`02-custom-patch-baseline.md`](./docs/02-custom-patch-baseline.md)
- [`03-tagging-windows.md`](./docs/03-tagging-windows.md)
- [`04-patching-windows.md`](./docs/04-patching-windows.md)
- [`05-verifying-compliance.md`](./docs/05-verifying-compliance.md)
- [`conclusion.md`](./docs/conclusion.md)

---

## 🖼️ Screenshots

| Task | Screenshot |
|------|-------------|
| Patch Linux instances | `screenshots/patch-linux.png` |
| Custom patch baseline | `screenshots/custom-baseline.png` |
| Tagging Windows instances | `screenshots/tagging-windows.png` |
| Patching Windows instances | `screenshots/patching-windows.png` |
| Verifying compliance | `screenshots/compliance.png` |

---

## 🧩 AWS Services Used
- **AWS Systems Manager (SSM)**
  - Patch Manager
  - Run Command
  - State Manager
  - Fleet Manager  
- **Amazon EC2**

---

## 📈 Compliance Verification
At the end of the project, all six instances (3 Linux + 3 Windows) showed **Compliant** status.

| Instance Type | Patch Group | Compliance Status | Baseline ID | Last Operation |
|----------------|-------------|------------------|--------------|----------------|
| Linux | LinuxProd | ✅ Compliant | AWS-AmazonLinux2DefaultPatchBaseline | *Timestamp* |
| Windows | WindowsProd | ✅ Compliant | CustomBaseline-WindowsServerSecurityUpdates | *Timestamp* |

---

## 🏁 Conclusion
You have successfully:
- Patched Linux instances using default baselines
- Created a custom patch baseline for Windows
- Used patch groups and tagging for Windows patching
- Verified compliance across all instances

---

## 📜 Author
**Suvo Biswas**

📍 Jamaica, New York  
📧 [GitHub Repository Link (once uploaded)](https://github.com/yourusername/AWS-Systems-Manager-Patch-Hardening)

---
