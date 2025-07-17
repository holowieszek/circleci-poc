#!/bin/bash

set -e

echo "Branch: $CIRCLE_BRANCH"

BRANCH_NAME="$CIRCLE_BRANCH"

if [[ "$BRANCH_NAME" == "prod" ]]; then
    export WORKFLOW_FILE=.circleci/workflows/prod.yml
elif [[ "$BRANCH_NAME" == "develop" ]]; then
    export WORKFLOW_FILE=.circleci/workflows/dev.yml
elif [[ "$BRANCH_NAME" =~ ^feat\/(.+)$ ]]; then
    ENV_NAME="${BASH_REMATCH[1]}"
    echo "export ENV_NAME=$ENV_NAME" >>$BASH_ENV
    export WORKFLOW_FILE=.circleci/workflows/dev.yml
else
    echo "No workflow defined for branch: $BRANCH_NAME"
    exit 0
fi

echo $WORKFLOW_FILE
cp $WORKFLOW_FILE .circleci/workflows/selected_workflow.yml
