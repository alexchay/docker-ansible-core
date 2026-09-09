# Changelog

All notable changes to this project will be documented in this file.

## 2026.09.09.0

[4cd0196](4cd0196fda7a49a85a6d5b89d9ab6eb42fbea799)...[5d7048a](5d7048a71a240ff83b4d84c6e792d335ca2ca4aa)

### Bug Fixes

* [15b06ec](15b06ec6d4ea910175282dc3c8f691460d6c0392): Add UV_NO_MANAGED_PYTHON=1 in Dockerfile 
* [a540799](a540799706e942d817727afc6cf8eeefdcd58248): Streamline symbolic link creation for ansible-core executables 
* [de8f221](de8f22172ffd19a99b07b5d3fa822802a682dc27): Update hadolint settings to set failure threshold to warning (was info by default) 
* [6b711ae](6b711ae95233d05d2c28493576c143412fc90774): Correct build_env_file reference in build job to use outputs from setup_build_env 
* [5d7048a](5d7048a71a240ff83b4d84c6e792d335ca2ca4aa): Enable shell execution in bump-my-version hooks 

### Miscellaneous Tasks

* [be42495](be4249594cafd2c605e644fc7cf93a85ffcfcca9): Update matrix configuration to inlcude Ansible core versions 2.19, 2.20 and 2.21, remove 2.15, 2.17 
* [65f66a9](65f66a91d750feec26fe9da4536885d02ad0e9e4): Update Ansible Core version to 2.20.8 in build environment 

## 2025.06.13.0

### CI

* [764daf1](764daf13a2a9fa19cc8e88a11982db2b41afea3e): Add GitLab CI/CD configuration files for Docker image build and matrix support 
* [eba7903](eba7903c5856921e989854ac36a5138bd307cc15): Add GitHub CI/CD configuration files for Docker image build and matrix support 

### Features

* [55231ee](55231ee5b5f30b5a312f4ef980f3610c1fd000ec): Add configuration files including  Dockerfile for building image 
* [1260c1e](1260c1ecf3836cde26d1a63ed06b86c876545e52): Add shellcheck configuration and test scripts for Docker container 

### Miscellaneous Tasks

* [acc4b5d](acc4b5d1bdc4c2dbe1244c487c3e5a61b6027d81): Add initial Taskfile and taskfiles for dependency management and versioning 
* [bd1106d](bd1106d1e7d25e95fafebae7f9ab1c87a103718a): Add pre-commit configuration 
* [733ba6c](733ba6c8893acaa88a09ca13f8cd9094ce3eeac7): Add changelog and git-cliff configuration for automated changelog generation 
* [4f43e61](4f43e61352396f5a6510d8a13b81cf42e34b37c8): Add version management and project configuration 

### Other

* [25ba16b](25ba16bbf2cd2f253956dcb5904247795e2ccd0e): Initial commit 


====
