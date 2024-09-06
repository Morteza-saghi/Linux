#! /bin/bash

while true; do
    ts=$(kubectl get pods -A  grep Terminating  awk '{print $1, $2}')
    if [ -z $ts ]; then
        break
    fi
    while read -r namespace pod; do
        kubectl delete pod $pod -n $namespace --force --grace-period=0
    done  $ts
    sleep 2
done

