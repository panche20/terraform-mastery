# Terraform Mastery

A comprehensive collection of Terraform related labs and hands-on exercises designed to help you master Infrastructure as Code (IaC) concepts and Terraform best practices.

## 📋 Overview

This repository contains Terraform related labs that cover various aspects of infrastructure provisioning, management, and automation. Whether you're a beginner learning the basics or an experienced practitioner looking to refine your skills, you'll find practical examples and exercises here.

## 🎯 Objectives

- Learn Terraform fundamentals and syntax
- Understand infrastructure as code principles
- Practice provisioning cloud resources
- Explore Terraform modules and best practices
- Master state management and collaboration workflows

## 📁 Repository Structure

```
terraform-mastery/
├── README.md
├── lab-1/          # Introductory labs
├── lab-2/          # Intermediate exercises
├── ...
└── common/         # Shared resources and utilities
```

## 🛠️ Prerequisites

Before getting started, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads) (v1.0 or higher)
- A cloud provider account (AWS, Azure, GCP, etc.)
- Basic knowledge of command-line interface
- Familiarity with your chosen cloud provider

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/panche20/terraform-mastery.git
   cd terraform-mastery
   ```

2. **Navigate to a lab**
   ```bash
   cd lab-1
   ```

3. **Initialize Terraform**
   ```bash
   terraform init
   ```

4. **Review the configuration**
   ```bash
   terraform plan
   ```

5. **Apply the configuration**
   ```bash
   terraform apply
   ```

## 📚 Lab Contents

Each lab directory contains:
- `main.tf` - Primary Terraform configuration
- `variables.tf` - Input variables definition
- `outputs.tf` - Output values
- `terraform.tfvars` - Variable values (example)
- `README.md` - Lab-specific instructions and details

## 💡 Learning Path

Start with the foundational labs and progress to advanced topics:

1. **Basics** - Resource creation and basic syntax
2. **Intermediate** - Variables, outputs, and state management
3. **Advanced** - Modules, workspaces, and automation
4. **Best Practices** - Security, organization, and CI/CD integration

## 🔐 Important Security Notes

- **Never commit sensitive data** - Use `.gitignore` for `terraform.tfvars` and state files
- **Use environment variables** for credentials
- **Enable remote state** with proper access controls
- **Review all plans** before applying to production

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/lab-name`)
3. Commit your changes (`git commit -am 'Add new lab'`)
4. Push to the branch (`git push origin feature/lab-name`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🔗 Useful Resources

- [Official Terraform Documentation](https://www.terraform.io/docs)
- [Terraform Registry](https://registry.terraform.io/)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices)
- [Cloud Provider Documentation](https://www.terraform.io/docs/providers)

## 🐛 Troubleshooting

### Common Issues

**Issue: "terraform command not found"**
- Ensure Terraform is properly installed and added to your PATH

**Issue: "Provider not found"**
- Run `terraform init` to download required providers

**Issue: "Insufficient permissions"**
- Verify your cloud provider credentials and account permissions

For more help, check individual lab README files or consult the official documentation.

## 📧 Contact

For questions or suggestions, please open an issue in the repository.

---

Happy learning! 🚀
