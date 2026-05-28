#!/bin/bash

ec="$1"

if [ "$ec" -eq 177 ]; then
  echo "Checkpoint exit 177: asking DAGMan to retry"
  exit 1
fi

if [ "$ec" -eq 0 ]; then
  echo "Success exit 0: done"
  exit 0
fi

echo "Non-retry failure exit $ec: stopping DAG"
exit 0
