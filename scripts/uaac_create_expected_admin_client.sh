#!/bin/bash

set -e # exit immediately if a simple command exits with a non-zero status
set -u # report the usage of uninitialized variables
set -x

source .envrc

uaac target $UAA_URL --skip-ssl-validation
uaac token client get $ADMIN_CLIENT_ID --secret $ADMIN_CLIENT_SECRET

uaac client add $EXPECTED_ADMIN_CLIENT_ID --secret $EXPECTED_ADMIN_CLIENT_SECRET \
  --no-interactive \
  --scope uaa.none \
  --authorities scim.write,clients.write,clients.read,scim.read,uaa.admin,clients.secret \
  --authorized_grant_types authorization_code,client_credentials,refresh_token \
  --debug