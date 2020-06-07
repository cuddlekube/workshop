#!/bin/bash
tasks=$(aws ecs list-tasks --cluster cuddlekube --query 'taskArns' --output text)
listtasks=$(echo $tasks | tr "\t" "\n")
for task in $listtasks
do
    aws ecs stop-task --cluster cuddlekube --task $task
done