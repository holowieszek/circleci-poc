#!/bin/bash

set -e

echo "Branch: $CIRCLE_BRANCH"

BRANCH_NAME="$CIRCLE_BRANCH"

if [[ "$BRANCH_NAME" == "prod" ]]; then
    echo 'export WORKFLOW_FILE=.circleci/workflows/prod.yml' >>$BASH_ENV
elif [[ "$BRANCH_NAME" == "develop" ]]; then
    echo 'export WORKFLOW_FILE=.circleci/workflows/dev.yml' >>$BASH_ENV
elif [[ "$BRANCH_NAME" =~ ^feat\/(.+)$ ]]; then
    ENV_NAME="${BASH_REMATCH[1]}"
    echo "Extracted environment: $ENV_NAME"

    echo 'export WORKFLOW_FILE=.circleci/workflows/dev.yml' >>$BASH_ENV
    echo "export ENV_NAME=$ENV_NAME" >>$BASH_ENV
else
    echo "No workflow defined for branch: $BRANCH_NAME"
    exit 0
fi
