#!/bin/bash

mkdir ~/.minikube/user-certs
cd ~/.minikube/user-certs

for user in devops-misha operations-engineer-slava developer-petr security-auditor-sergei
do
  openssl genrsa -out ${user}.key 2048
  openssl req -new -key ${user}.key -subj "/CN=${user}" -out ${user}.csr
  openssl x509 -req -in ${user}.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ${user}.crt -days 365
done

for user in devops-misha operations-engineer-slava developer-petr security-auditor-sergei
do
  kubectl config set-credentials ${user} --client-certificate=${PWD}/${user}.crt --client-key=${PWD}/${user}.key
  kubectl config set-context ${user}-context --cluster=minikube --namespace=default --user=${user}
done