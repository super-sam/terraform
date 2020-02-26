#!/bin/bash
cd ../myLambdaFunction
zip -r ../lambdaFunction ./*
aws s3 cp lambdaFunction.zip s3://supertestbucker --profile adminuser