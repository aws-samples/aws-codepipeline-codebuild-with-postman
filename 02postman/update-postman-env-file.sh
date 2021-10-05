#!/usr/bin/env bash

#This shell script updates Postman environment file with the API Gateway URL created
# via the api gateway deployment

echo "Running update-postman-env-file.sh"

api_gateway_url=`aws cloudformation describe-stacks \
  --stack-name signosoft-api-stack \
  --query "Stacks[0].Outputs[*].{OutputValueValue:OutputValue}" --output text`

echo "API Gateway URL:" ${api_gateway_url}

jq -e --arg apigwurl "$api_gateway_url" '(.values[] | select(.key=="apigw-root") | .value) = $apigwurl' \
  TEST.postman_environment.json > TEST.postman_environment.json.tmp \
  && cp TEST.postman_environment.json.tmp TEST.postman_environment.json \
  && rm TEST.postman_environment.json.tmp

echo "Updated TEST.postman_environment.json"

cat TEST.postman_environment.json

jq -e --arg apigwurl "$api_gateway_url" '(.values[] | select(.key=="apigw-root") | .value) = $apigwurl' \
  SignosoftAPITests.postman_collection.json > SignosoftAPITests.postman_collection.json.tmp \
  && cp SignosoftAPITests.postman_collection.json.tmp SignosoftAPITests.postman_collection \
  && rm SignosoftAPITests.postman_collection.json.tmp

echo "Updated SignosoftAPITests.postman_collection.json"


cat SignosoftAPITests.postman_collection.json