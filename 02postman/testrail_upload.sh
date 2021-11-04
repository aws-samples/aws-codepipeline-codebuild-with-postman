#!/usr/bin/env bash

TESTRAIL_DOMAIN=signosoft.testrail.io 
TESTRAIL_USERNAME=tom.signosoft@signosoft.com 
TESTRAIL_APIKEY=ANLaCkgeIaDq9YStec2t-Xf/cbPT8EjZz8RFsEJWG 
TESTRAIL_PROJECTID=3
DATE=$( date '+%d-%m-%Y %H:%M:%S' )
TESTRAIL_TITLE="IntegrationTests[APIv1] Automated Test Run $DATE" 
newman run SignosoftAPITests.postman_collection.json --environment TEST.postman_environment.json --reporters cli,testrail
 