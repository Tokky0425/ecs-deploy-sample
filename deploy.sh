#!/bin/sh

eval $(aws ecr get-login --region ap-northeast-1)
docker push $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/test:$CIRCLE_SHA1
./ecs-deploy --cluster test --service-name test-service --image $AWS_ACCOUNT_ID.dkr.ecr.ap-northeast-1.amazonaws.com/test:$CIRCLE_SHA1
