# compose_tester

__Ansible playbooks for validating composes of a [modular Linux OS](https://docs.pagure.org/modularity/).__


Contents
--------
* `deploy.yaml`: Main Ansible playbook to install and run docker services, pull a docker image of a modular Linux OS, run a container and run a set of tests inside that docker container.
* `tests/`: Test suite (test cases) to verify the functionality of a compose. Mind `tests/quick_mini_test.yaml`.
This playbook tests only a few selected modules.

Requirements
---------------
* Fedora or RHEL OS.
* [Ansible](http://docs.ansible.com/ansible/intro_installation.html#latest-release-via-yum) version 2.4. and higher. 

Usage
--------

* Clone this repo
* Navigate there
* As a sudo user run:
```
ansible-playbook deploy.yaml  --extra-vars "compose=LINK/TO/TESTED/COMPOSE"
```

__Mind the mandatory extra variable `compose`__ It can be a name of the container, e.g: 

```
ansible-playbook deploy.yaml  --extra-vars "compose=registry.fedoraproject.org/f26-modular/boltron"

```

All failed tasks and tests will be highlighted in red.
Please mind Ansible bug that [a failed counter in Play Recap is not updated correctly](https://github.com/ansible/ansible/issues/27160). When fixed, the total number of failed tests will be displayed accordingly.


__If you find a bug or want new features and tests to be added, [please report it!](https://github.com/alexxa/compose_tester/issues)__
