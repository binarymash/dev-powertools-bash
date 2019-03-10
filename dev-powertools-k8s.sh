#!/bin/bash

alias k="kubectl"

kgp(){
  if [ $# -eq 0 ]; then
    k get pods | grep $1 
  else
    k get pods
  fi 
}

kcv(){
  k config view
}

kp(){
  k proxy
}

kdasht(){
  k -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}') | grep token
}

kdash(){
  echo dashboard url is http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/login
  echo login with token shown below....
  echo ---
  kdasht
  echo ---
  k proxy
}
