
#

## Ansible Core Docker Image

A reproducible, customizable Docker image for running [Ansible Core](https://docs.ansible.com/ansible/latest/) with modern Python and tooling. This project is designed for CI/CD, automation, and local development, supporting multiple Python and Ansible Core versions via a build matrix.

#### Features

- **Multi-version support:** Build images for different Ansible Core and Python versions using a matrix ([`.github/matrix.yml`](.github/matrix.yml)).
- **Fast dependency management:** Uses [uv](https://github.com/astral-sh/uv) for Python dependency resolution and installation.
- **Pre-installed tools:** Includes `ansible-core`, `ansible-lint`, `go-task`, `envconsul`, and common CLI utilities.
- **Optimized builds:** Leverages Docker BuildKit for caching and efficient builds.

#### Customization

To customize the Docker image:

- Edit the `Dockerfile` to add or remove dependencies and tools.
- Modify [`.github/matrix.yml`](.github/matrix.yml) to adjust the build matrix.
- Use `Taskfile.yml` to automate common tasks (build, lint, test, etc.).

#### Versioning

This project uses CalVer (calendar versioning) managed by [bump-my-version](https://github.com/callowayproject/bump-my-version). See [pyproject.toml](pyproject.toml) for configuration.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
