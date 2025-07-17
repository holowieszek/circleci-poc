#!/bin/bash

set -e

echo "Branch: $CIRCLE_BRANCH"

BRANCH_NAME="$CIRCLE_BRANCH"

if [[ "$BRANCH_NAME" == "prod" ]]; then
    WORKFLOW_FILE=".circleci/workflows/prod.yml"
elif [[ "$BRANCH_NAME" == "develop" ]]; then
    WORKFLOW_FILE=".circleci/workflows/dev.yml"
elif [[ "$BRANCH_NAME" =~ ^feat\/(.+)$ ]]; then
    ENV_NAME="${BASH_REMATCH[1]}"
    echo "Extracted environment: $ENV_NAME"

    # Optional: dynamically set an env var or pass ENV_NAME to the workflow
    export ENV_NAME

    WORKFLOW_FILE=".circleci/workflows/dev.yml"
else
    echo "No workflow defined for branch: $BRANCH_NAME"
    exit 0
fi

echo "Using workflow file: $WORKFLOW_FILE"

circleci continuation continue \
    --config "$WORKFLOW_FILE" \
    --revision "$CIRCLE_SHA1"
