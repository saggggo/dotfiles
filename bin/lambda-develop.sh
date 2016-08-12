#!/bin/sh
# lambdaでローカル開発するためのscript

dynamoPath="/opt/dynamoDB"


alias aws-lambda=python-lambda-local
cd ${dynamoPath}
java -Djava.library.path=./DynamoDBLocal_Lib -jar ./DynamoDBLocal.jar -sharedDb &
