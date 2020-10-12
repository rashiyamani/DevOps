#!/bin/bash

echo "Shell started"
echo "==========================="

APP_NAME=rashiya100test
ECS_REPOSITORY=074002960123.dkr.ecr.us-east-1.amazonaws.com
BUILD_NUMBER=12
#------------------------------------------------------------------------------
APP_TAG=$APP_NAME

APP_DOCKER_IMAGE_NAME=$ECS_REPOSITORY/$APP_TAG

docker build -t $APP_DOCKER_IMAGE_NAME .

echo
echo "tagging $APP_DOCKER_IMAGE_NAME to latest"
echo

#docker tag $APP_DOCKER_IMAGE_NAME $ECS_REPOSITORY:$APP_NAME-$ENV-${BUILD_NUMBER}

echo 'Logging into AWS Docker'
#eval $(aws ecr get-login --no-include-email | sed 's|https://||' )
$(aws ecr get-login --no-include-email --region us-east-1)


echo "Pushing new image $DOCKER_IMAGE_NAME to ECR"

docker push $ECS_REPOSITORY/$APP_NAME

echo "--------------------------------------------------"
echo "Build ended"
