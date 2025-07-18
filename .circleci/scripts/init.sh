#!/bin/bash
set -x

if [[ -n "$FEATURE_ENV" ]]; then
    printf "Feature environment: $FEATURE_ENV"

    tofu init \
        --backend-config=config/backend/$ENVIRONMENT_NAME.tfbackend \
        --backend-config="bucket=$TERRAFORM_STATE_GCLOUD_STORAGE_BUCKET" \
        --backend-config="prefix=terraform/$FEATURE_ENV/terraform.tfstate"
else
    tofu init \
        --backend-config=config/backend/$ENVIRONMENT_NAME.tfbackend \
        --backend-config="bucket=$TERRAFORM_STATE_GCLOUD_STORAGE_BUCKET"
fi
