# compose_tester

__Ansible playbooks for buidling and validating composes of a [modular Linux OS](https://docs.pagure.org/modularity/).__


Contents
--------
* `deploy.yaml`: Main Ansible playbook to set up the [Vagrant](https://www.vagrantup.com/intro/index.html) machine, build the docker image of a modular Linux OS, and run a set of tests 
inside a docker container.
* `tests/`: Test suite (test cases) to verify the functionality of a compose. Mind `tests/quick_mini_test.yaml`.
This playbook tests only a few selected modules.
* `data/`: Data files
    - `data/boltron.cfg`: The Boltron compose configuration file.
    - `data/build-image.cfg`: A bash script to create a docker image. To be replaced with Ansible playbook. See Issue #2.
    - `data/insecure_private_key`: A key to ssh connect to the Vagrant machine.
* `Vagrantfile`: A file to provision the Vagrant machine. Most of it will be replaced with Ansilbe playbook. See Issue #1.

Requirements
---------------
* Fedora OS. RHEL is not supported at the moment.
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html#latest-release-via-yum) version 2.4. and higher. 

Usage
--------

* Clone this repo
* Navigate there
* As a sudo user run:
```
ansible-playbook deploy.yaml  --extra-vars "compose=LINK/TO/TESTED/COMPOSE"
```

__Mind the mandatory extra variable `compose`__ It can be a koji url link or a name of the container, e.g: 

```
ansible-playbook deploy.yaml --extra-vars "compose=https://kojipkgs.stg.fedoraproject.org/compose/branched/psabata/latest-Fedora-Modular-26/compose/Server/x86_64/os/"
```
```
ansible-playbook deploy.yaml  --extra-vars "compose=registry.fedoraproject.org/f26-modular/boltron"

```

The first playbook run can take 20+ minutes because of the Vagrant provisioning.
All failed tasks and tests will be highlighted in red.
Please mind Ansible bug that [a failed counter in Play Recap is not updated correctly](https://github.com/ansible/ansible/issues/27160). When fixed, the total number of failed tests will be displayed accordingly.


__If you find a bug or want new features and tests to be added, [please report it!](https://github.com/alexxa/compose_tester/issues)__
