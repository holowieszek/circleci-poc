#!/bin/bash

tofu init \
    --backend-config=config/backend/$ENVIRONMENT_NAME.tfbackend \
    --backend-config="bucket=$TERRAFORM_STATE_GCLOUD_STORAGE_BUCKET"
