# Firebase Workshop for FWDays

## Tech Stack
- [Google Cloud](https://cloud.google.com/) for infrustructure
- [GitHub](https://github.com/) for storing source code
- [Terraform](https://www.terraform.io/) for IaaC
- [Terraform cloud](https://app.terraform.io/) for terraform state. Use local deployment
- [tflint](https://github.com/terraform-linters/tflint) for lint tf files
- [pre-commit](https://pre-commit.com/) for force best practices

## Project structure

– [envs/web](/envs/web/) - describes signle environments. We use terraform workspaces for switching between envs.
– [envs/web-shared](/envs/web-shared/) - describes web-shared project with resources reused between environments. DNS, registry, etc. 
- modules – planned, but not created. This folder will be used for internal modules.

Every envs folder has `.terraform.lock.hcl` file. It guarantees repetability during providers installation. Use 
`terraform providers lock -platform=linux_arm64 -platform=linux_amd64 -platform=darwin_amd64 -platform=windows_amd64` for generate it for every platform.

### Google Cloud

Options 1.
Run `gcloud auth application-default login` for generate User Application Default Credentials. More details at [documentation](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#primary-authentication).

Options 2.
Create service account key. We use this approach during workshop.
