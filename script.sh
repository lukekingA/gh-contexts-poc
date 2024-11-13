#!/bin/bash

JOBS=""

JOB="job1"

JOBS+=" $JOB"

echo $JOBS

JOBS+=" $JOB"

echo $JOBS

echo ${JOBS[@]}

for job in ${JOBS[@]}; do
  echo "job - $job"
done