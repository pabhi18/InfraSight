#!/bin/bash

mkdir -p environments/dev environments/prod
mkdir -p modules/ec2 modules/rds modules/cloudwatch

for i in $(ls ./modules); do
  touch ./modules/$i/main.tf ./modules/$i/variables.tf ./modules/$i/outputs.tf
done

for i in $(ls ./environments); do
  touch ./environments/$i/main.tf ./environments/$i/terraform.tfvars
done

touch main.tf terraform.tfvars variables.tf outputs.tf providers.tf