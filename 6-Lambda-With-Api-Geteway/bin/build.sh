#!/bin/bash
cd ../myLambdaFunction
zip -r ../lambdaFunctionWithAPI ./*
aws s3 cp lambdaFunctionWithAPI.zip s3://supertestbucker --profile adminuser