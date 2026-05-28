# Important Repository Structure Recommendation

This project should be created as a completely separate GitHub repository.

Reason:

GitHub Actions workflows must exist at the repository root level:

```text
.github/workflows/
```

If this project is placed inside another Terraform monorepo or nested project structure, GitHub Actions workflows may not execute correctly and can create CI/CD conflicts with other projects.

Recommended approach:

* Create a dedicated GitHub repository for this project
* Copy all provided files exactly as given
* Keep `.github/` at repository root level
* Do not place this project inside another Terraform projects repository

Recommended structure:

```text
01-public-security-group-governance/
├── .github/
│   └── workflows/
│       └── governance.yml
│
├── policies/
│   └── deny-public-ssh.yaml
│
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
│
├── .gitignore
├── task.md
└── execution-guide.md
```

This ensures:

* proper GitHub Actions execution
* isolated governance pipelines
* clean CI/CD behavior
* easier debugging
* production-style project separation
* simpler governance automation management
