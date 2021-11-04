#!/usr/bin/env bash

TESTRAIL_DOMAIN=https://signosoft.testrail.io/ 
TESTRAIL_USERNAME=tom.signosoft@signosoft.com 
TESTRAIL_APIKEY=t8YzLgXHVMCu4IFHf7iM-of/edM3r47XOu6XyLzSB 
TESTRAIL_PROJECTID=3
TESTRAIL_TITLE="Signosoft API v1 Tests" 
newman run SignosoftAPITests.postman_collection.json --environment TEST.postman_environment.json --reporters cli,testrail
 