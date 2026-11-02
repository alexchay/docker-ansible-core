# Changelog

All notable changes to this project will be documented in this file.

## 2026.11.02.1

[e18c25b](e18c25be1c7105ec61e82dbe97245f0d9a6c5fbf)...[d1b6a15](d1b6a155e2656f8364e93ebeabbbbe13efd19219)

### Bug Fixes

* [d1b6a15](d1b6a155e2656f8364e93ebeabbbbe13efd19219): Add hadolint ignore rule for cases where pip is updated without specifying a version 

## 2026.11.02.0

[70270b5](70270b54cb1968947b62e1c909237a4199b00ce8)...[649d0f6](649d0f6f7beb43c544b89e5fc9ca6fdccdc01d7d)

### Features

* [4025493](40254935d0542a44dafff9637dd9b0f4e95affab): Install ansible collections into  ANSIBLE_COLLECTIONS_PATH 

### Miscellaneous Tasks

* [649d0f6](649d0f6f7beb43c544b89e5fc9ca6fdccdc01d7d): Add commands to list installed Python packages and Ansible collections 

## 2026.10.25.0

[f44bebe](f44bebec96842c6f3aaf013653c05c2e022902d2)...[7150efa](7150efaef0061aba9277d133fd3d25f06b8f24f6)

### Bug Fixes

* [7805169](7805169d6a4e7cc034922715917006335f98a57d): Install ansible using pip in the user environment. 

### Dependencies

* [8ab1e60](8ab1e60f6e09ffae16b7a8e8a7898e42ae463d48): Update ansible core to 2.19.14, 2.20.10 and 2.21.5 

### Features

* [bc0d045](bc0d045da027cf9a5ea1a75cff581e06aed17476): Add ip utils to the list of installed packages in Dockerfile 
* [915e029](915e029e71b2359e3bd3df62353c70896385bcb2): Add "pexpect" to ansible requirements 
* [d01ccc7](d01ccc704e97bedd0b5dd42501186f4121640067): Add "git" to the list of installed packages in Dockerfile 

### Miscellaneous Tasks

* [7150efa](7150efaef0061aba9277d133fd3d25f06b8f24f6): Add tasks to copy docker image to podman storage 

## 2026.09.15.0

[ebeefbf](ebeefbf3da608d63f75a51bbc07b3af8815a14c1)...[3f39336](3f393365859dc1b83993661128c2ba37f984116e)

### Features

* [f32f5a6](f32f5a620723e197d723fbc95a9b58b9cf1437cf): Add community.general collection version 13.4.0 

### Miscellaneous Tasks

* [e9d2a36](e9d2a36081ce81571691a320f1a3347b9fcb98b4): Bimp Ansible core versions to 2.19.13, 2.20.8 and 2.21.4 
* [3f39336](3f393365859dc1b83993661128c2ba37f984116e): Bump Ansible Core version to 2.20.9 in environment files 

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
