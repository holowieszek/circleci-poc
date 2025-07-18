#!/bin/bash

tofu init \
    --backend-config=config/backend/dev.tfbackend \
    --backend-config="bucket=$TERRAFORM_STATE_GCLOUD_STORAGE_BUCKET"
