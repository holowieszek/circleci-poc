#!/bin/bash

curl -L "https://github.com/opentofu/opentofu/releases/download/v${TOFU_VERSION}/tofu_${TOFU_VERSION}_linux_amd64.zip" -o tofu.zip
unzip -o tofu.zip
sudo install -m 0755 tofu /usr/local/bin/tofu
rm -rf tofu
rm -rf tofu.zip
tofu --version
