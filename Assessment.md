# Assessment: Use Case Oriented Project

## Project Overview
You are tasked with setting up a CI/CD pipeline for a microservices-based application. The
application will be containerized using Docker and orchestrated using Kubernetes. Ansible
will be used for configuration management and deployment. The entire setup should be
managed using Git for version control, and Jenkins will be used to automate the CI/CD
process.

### Assessment Criteria
1. Git:
+ Repository setup
 +  Branching strategies
 + Commit and merge practices

2. Jenkins:
 + Pipeline creation using Jenkinsfile
 + Integration with Git
 + Automated build, test, and deployment stages

3. Docker:
 + Dockerfile creation
 + Image building and management
 + Containerization of microservices

4. Kubernetes:
 + Pod and service creation
 + Deployments and replica sets
 + ConfigMaps and Secrets

5. Ansible:
 + Playbook creation
 + Use of variables and templates
 + Inventory management


### Use Case Scenario

Your company is developing a new e-commerce application consisting of several
microservices: a front-end service, a product catalog service, and an order processing
service. The goal is to automate the deployment and configuration of these services across
development, testing, and production environments using Ansible, Docker, Kubernetes, and
Jenkins.

### Tasks and Deliverables

#### Task 1: Git Repository Setup
1. Create a Git repository to store all project files, including Ansible playbooks,
Dockerfiles, and Kubernetes manifests.

2. Branching Strategy:
 + Create branches for development, testing, and production. using following command

 ```
 git branch development
 git branch testing
 git branch production
 
 ```

 <br>

 ![alt text](images/image.png)
 +  Implement a strategy for merging changes from development to testing and
production.

#### Task 2: Dockerize Microservices

1. First we create frontend , backend, and database directory on **development branch**
```
mkdir frontend backend databse
```

2. create shared network and volume 
 `sudo docker network create fullstack-network `

 <br>

 ![alt text](images/image-11.png)

 `sudo docker volume create pgdata`

 <br>

  ![alt text](images/image-12.png)

3. Create Dockerfiles for each microservice (front-end, product catalog, order
processing).

4. Build Docker images for each microservice and push them to a container registry
(e.g., Docker Hub).

5. Deliverables:

+ Dockerfiles for each microservice

 1. in frontend folder create **index.html** and **dockerfile** for front-end on development branch

  <br>

  ![alt text](images/image-1.png)

  <br>

  ![alt text](images/image-2.png)

 2. in backend folder create **index.js** and **docekrfile** on development branch.
   + for this first we initialize the Node.js application by using command :

    `npm init -y`
    <br>

     ![alt text](images/image-13.png)

   + Now we will install PostgresSql client for Node.js by using command :

   ` npm install express pg`

   <br>

   ![alt text](images/image-14.png)

  <br>

   ![alt text](images/image-6.png)

   <br>

 ![alt text](images/image-7.png)
  
  3. in database create **dockerfile** on development branch

  <br>

 ![alt text](images/image-8.png)


+ Built Docker images in a container registry

 1. build the image of **front-end** in **development branch** using command 
   `sudo docker build -t frontend . `

   <br>

   ![alt text](images/image-3.png)


  2. Build the **database** in **development branch** using command :

  ` sudo docker build -t my-postgres-db .`

  <br>

   ![alt text](images/image-9.png)
  
  3. Build the **backend** in **development branch** using command :

  ` sudo docker build -t backend .` 

  <br>

   ![alt text](images/image-15.png)

2. Run the container 

 1. Run the **frontend** container in **development** using command :
 ` sudo docker run --name frontend-container --network fullstack-network -d -p 8082:80 frontend `
 <br>

 ![alt text](images/image-4.png)

  2. Run the **frontend** container in **production** branch using command :

   ` sudo docker run --name frontend-production-container --network fullstack-network -d -p 8083:80 frontend`

  <br>

  ![alt text](images/image-17.png)

  3. Run the **frontend** container in **testing** branch using command :

   ` sudo docker run --name frontend-testing-container --network fullstack-network -d -p 8084:80 frontend`

   <br>

   ![alt text](images/image-19.png)

 2. run the **postgreSQL** database container using command :

 `sudo docker run --name postgress-container --network fullstack-network -v pgdata:/var/lib/postgresql/data -d my-postgres-db`


 <br>

![alt text](images/image-10.png)

 3. Run the **backend** container using command :

 `docker run --name backend-container --network fullstack-network -d backend `

 <br>

 ![alt text](images/image-16.png)

3. on browser run  command `localhost:8082 ` to see output  of **development** branch.

 <br>

 ![alt text](images/image-5.png)

 4. on browser run  command `localhost:8083 ` to see output  of **production** branch.

 <br>

 ![alt text](images/image-18.png)

 5. on browser run  command `localhost:8084 ` to see output  of **testing** branch.
 
  <br>

  

#### do same above process for testing and production branch





#### Task 3: Kubernetes Deployment

1. Create Kubernetes manifests for deploying each microservice.
+ Define Pods, Services, Deployments, and ReplicaSets.
+ Use ConfigMaps and Secrets for configuration management.

2. Deploy the microservices to a Kubernetes cluster.

3. Deliverables:
+ Kubernetes manifests (YAML files)
+ Successful deployment of microservices in the Kubernetes cluster