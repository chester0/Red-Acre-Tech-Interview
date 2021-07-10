# Documentation

- Remove file locations for requirements in requirements.txt
- Remove unused requirements from requirements.txt


## After successfull local build

- Create Dockerfile for api
- Create Dockerfile for sys-stats



## Build/Push Commands for AWS

### API

`aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g0q4k7i4
docker build -t red-acre-api .
docker tag red-acre-api:latest public.ecr.aws/g0q4k7i4/red-acre-api:latest
docker push public.ecr.aws/g0q4k7i4/red-acre-api:latest`

Compose build:

`docker-compose up --build`


### Front End

`aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g0q4k7i4
docker build -t red-acre-frontend .
docker tag red-acre-frontend:latest public.ecr.aws/g0q4k7i4/red-acre-frontend:latest
docker push public.ecr.aws/g0q4k7i4/red-acre-frontend:latest`

