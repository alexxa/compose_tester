#!/bin/bash

date > test.log
microdnf install -y dnf
date >> test.log
dnf module list | tee -a test.log 
dnf list | tee -a test.log
dnf install @systemtools | tee -a test.log
dnf install httpd  | tee -a test.log
dnf install dhcp-server | tee -a test.log

