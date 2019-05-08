# Sample Microservice Application

Geek's Movie Shop (former Stan's Robot Shop) is a sample microservice application you can use as a sandbox to test and learn containerised application orchestration and monitoring techniques. It is not intended to be a comprehensive reference example of how to write a microservices application, although you will better understand some of those concepts by playing with it. To be clear, the error handling is patchy and there is not any security built into the application.

Forked from the original [Robot-Shop](https://github.com/instana/robot-shop) repository, by Instana.

This sample microservice application has been built using these technologies:
- NodeJS ([Express](http://expressjs.com/))
- Java ([Spark Java](http://sparkjava.com/))
- Python ([Flask](http://flask.pocoo.org))
- Golang
- PHP (Apache)
- MongoDB
- Redis
- MySQL
- RabbitMQ
- Nginx
- AngularJS

# Fork this repository

# Setup your playground EC2 instance

1. Setup an EC2 Amazon Linux instance with these properties:
    - t2.medium
    - 24Gb disk
2. Connect to the instance
3. Make a copy of *setup-ec2-instance.sh* and set the required variables:
    - YOUR_NAME
    - YOUR_COMPANY_NAME
    - NEW_RELIC_LICENSE_KEY
4. Copy and paste the changed content on the EC2 terminal
5. Open port 8888 on EC2 instance to the world (tip: edit instance security group inbound rules)
6. Take a note of the instance hostname (we need this value to set the PUBLIC_URL variable in .env)

# Clone your repository

1. Make a copy of *setup-repository.sh* and set the required variables:
    - GITHUB_USER
    - GITHUB_USER_NAME
    - GITHUB_USER_EMAIL
    - GITHUB_REPO
2. Copy and paste the changed content on the EC2 terminal
3. Edit *.env* and set the required variables:
    - GITHUB_USER
    - GITHUB_USER_NAME
    - GITHUB_USER_EMAIL
    - GITHUB_REPO
    - DOCKERHUB_USER
    - TAG=latest
    - PUBLIC_URL=http://*YOUR_INSTANCE_HOSTNAME*:8888
    - NEW_RELIC_LICENSE_KEY
    - CLUSTER_NAME=local
    - NEW_RELIC_BROWSER_LICENSE_KEY
    - NEW_RELIC_BROWSER_APPLICATION_ID
4. Change the repository to the desired training step

    `git branch -a`

    `git checkout --track <branch name>`

    Example:
    
    `git checkout --track origin/S00-no-instrumentation`

# Docker Deployment

1. Build all services

    `docker-compose build`

2. Bring all services up

    `docker-compose up -d`

3. Check loader service

    `docker container ls`

    Take note of the loader container id and use below

    `docker logs <container id> -f`

    Output should show a sequence of API calls across all services. Double-check PUBLIC_URL in .env if there is any error output.

# Access the Store

The store front is available on [http://EC2_INSTANCE_PUBLIC_DNS:8888](http://localhost:8888)

# Stop your services

`docker-compose down`

# Kubernetes Deployment

1. Run *setup-eks-cluster.sh* from the repository folder (it might take 15 mins to complete)

    `cd ~/${GITHUB_REPO}`
    
    `./setup-eks-cluster.sh`

2. Install New Relic Agents

    `cd ~/${GITHUB_REPO}/_infra`

    `./k8-newrelic.sh -c`
    
3. Deploy services

    `docker login`
    
    `cd ~/${GITHUB_REPO}`
    
    `docker-compose push`
    
    `cd ~/${GITHUB_REPO}/_infra`

    `./k8-services.sh -c`

4. Take note of EKS Load Balancer public URL

    `kubectl get services`

5. Update .env PUBLIC_URL variable with this DNS name on port 8080
6. Deploy the loader

    `./k8-loader.sh -c`
