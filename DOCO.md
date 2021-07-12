# Documentation

Get the api and front end building localy:

- Remove file locations for requirements in requirements.txt
- Remove unused requirements from requirements.txt


## After successfull local build

- Create Dockerfile/compose for api
- Create Dockerfile/compose for sys-stats



## Build/Push Commands for AWS

### API

`aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g0q4k7i4
docker build -t red-acre-api .
docker tag red-acre-api:latest public.ecr.aws/g0q4k7i4/red-acre-api:latest
docker push public.ecr.aws/g0q4k7i4/red-acre-api:latest`

expose port via command line argument: -p 5000:5000 (docker port/host port)

Compose build:

`docker-compose up --build`


### Front End

`aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/g0q4k7i4
docker build -t red-acre-frontend .
docker tag red-acre-frontend:latest public.ecr.aws/g0q4k7i4/red-acre-frontend:latest
docker push public.ecr.aws/g0q4k7i4/red-acre-frontend:latest`

expose port via command line argument: -p 4000:4000 (docker port/host port)


## Deploy resources to AWS with terraform

- Push build docker image to ECR (done)
- Create target group, load balancer, listener rule, route53 and docker container 
    using pushed image in ECR using terraform (WIP)


### NGINX Proxy
- Run in docker
- Setup up to serve the api backend to the front end can access

to run:

`docker run -it --rm -d -p 8080:80 --name web nginx`


## TODO

- some kind of variable replacement/obfuscation for API/Secret keys and to manage different values for 
  different environments (Octopus?)
- deploy rest of aws resources to aws (terraform plan/deploy)

## Other Notes

- Committing on a feature branch as per gitflow. - see: feature/first_attempt 
- Terraform is for all 3 containers resources.
- Will use the TaskDefinition.json to specify the AWS fargate container size/details
- Planing to use octopus with octostash for variable replacement
- No experience with Kubernetes and given my current setup, or lack thereof I will not be attempting
task 3.

