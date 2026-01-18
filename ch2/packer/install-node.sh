#!/usr/bin/env bash

set -e

curl -fsSL https://rpm.nodesource.com/setup_23.x | sudo bash -
sudo yum install -y nodejs
