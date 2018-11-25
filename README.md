# QUMU Project

Qumu Project Assignemnt

## Cloud Engineer - Coding Assignment

   - Merge two Dictionaries.
    
          python merge_dict.py
      
      Additionally use trace for detailed logging of python interpreter.
      
          python -m trace --trace merge_dict.py
   
   - Merge two Dictioneries using recursion.
   
            python merge_dict_recurssion.py
   
   
   - Concurrent health checks.
   
            python concurrent_health_checks.py
      
   Scripts are located under python3 module, sample outputs have been attached for reference.
 
 
 
 ## Cloud Engineer - Operations Assignment

### Deploy using Dokcer
    
   CloudFormation script "cloud_formation_script.json" can be found under "Sentry_Docker_Stack" module.
    
   **Summary** - The CloudFormation scripts provisions infastructure, deploy and runs sentry application.
   
   **AWS Architecture Diagram:** https://s3.ap-south-1.amazonaws.com/qumuhyd1/CloudFormation_Docker_Architecture.png

![alt text](https://s3.ap-south-1.amazonaws.com/qumuhyd1/CloudFormation_Docker_Architecture.png)

   **Description** - " The 'cloud_formation_script.json' to host sentry app. I am using my own hosted domain 'anmolposts.com' in Route53 to create a record set. The CloudFormation Template is AutoScalingMultiAZWithNotifications, creates a multi-az, load balanced and Auto Scaled sentry application running on ec2 instnace behind an application load balancer. The application is configured to span all Availability Zones in the region and is Auto-Scaled based on the CPU utilization of the web servers. Notifications will be sent to the operator email address on scaling events. The instances are load balanced with a simple health check against the default web page. Amazon Linux is chosen as the ami. Please proivde a public facing VPC and atleast two subnets(default) with internet access for application load balancer to function".

   **Parameters**:
   
   - `VPCId`: Internet facing VPC
   - `Subnets`: Two subnets
   - `InstanceType`: Default (t2.large)
   - `OperatorEmail`: Default (itsrai.anmol@gmail.com)
   - `KeyName`: Your Regional key pair
   - `SSHLocation`: Your Ip (Default: 0.0.0.0/0)
   - `DNSPrefix`: Prefix to attach to the hoted zone 'anmolposts.com'
              
   **Note**: Sentry hardware requirements minimum 2 CPU, 4GB RAM.

   On using t2.micro the instarnce freezes on running dokcer web upgrade because of resource constraints.
   
   - Recomended Instance type:
      - t2.xlarge 4 CPUS, 16GB RAM   
   - Minimum
      - t2.medium 2 CPUS, 4GB RAM
   
   **Sentry Home Page:** https://s3.ap-south-1.amazonaws.com/qumuhyd1/sentry_home_page.PNG
   
   Creating user account is optional hence it is skipped in the script
       
       "yes n | sudo docker-compose run --rm web upgrade"
       
   Otherwise on user account creation, Sentry Welcome page - https://s3.ap-south-1.amazonaws.com/qumuhyd1/sentry_login_successful.PNG

       
### Deploy using Terraform and Kubernetes
  
  Find the terraform scripts in the terraform module.
  
  **Note:** AWS **Fargate** is available only on **selected** regions, currently not avaiable in ap-south-1(Mumbai) region.
    
   To initialize a working directory containing Terraform configuration files.
     
            terraform init
   
   To let terraform to create an execution plan.  
            
            terraform plan
            
   To apply the changes required to reach the desired state of the configuration
   
            terraform apply
        
   **Description:** The terraform module creates ECS cluster and deploy Containers on Amazon’s ECS using *Fargate*. 
   The architecture uses Load Balancer, Route53 to expose services. The ECS service is autoscaled by using AutoScaling for fault tolerancy. Creates VPC, public and private subnet, security groups, deploys postgres in RDS, deploys redis in elasticache. Creates Container template, task definitions, ECS service and cluster.   
   
   **Note**: AWS credentials must be configured.
   
            aws configure
            EXPORT Access key ID = XXXXXXXXXXXXXX
            EXPORT Secret access key = XXXXXXXXXXXX
   
   **Components:**
   - `variables.tf` conatians all the variables required in the module.
   - `connections.tf` specifies the aws connection provider.
   - `network.tf` creates vpc, public and private subnet, internet gateway, route table and nat gateway.
   - `ecs.tf` creates ecs cluster, ecs tasks definitions, ecs service. Attaches ecs service to load balancer.
   - `alb.tf` creates load balance, its target groups and its listeners.
   - `auto_scaling.tf` creates auto scaling to attach to the ecs service, auto scaling policies based on cloud watch alarms.
   - `security.tf` creates security group for load balancer and ecs tasks.
   - `rds_postgres.tf` deploys postgres to RDS db with security group and subnets.
   - `redis.tf` deploys redis cluster to elasticache.
   - `route53_mapping.tf` creates an alias for loadbalancer using hosted zone 'anmolposts.com'. 
   
Fargate Resource Settings:
- fargate_cpu: 1024 cpu units
- fargate_memory: 2048 MiB

Modifications under `variables.tf`.
        
Deploying to aws fargate using kubernetes with **virtual-kubelet**.

**Prerequisites:** Having kubernetes cluster master setup with **kops** in order to create Kubernetes Clusters on AWS Using Kops.
I have documeneted my setup of Kubernetes cluster on aws using kops. 

To create kube cluster using kops:

     kops create cluster --node-count=2 --node-size=t2.medium --zones=us-east-1a --name=${KOPS_CLUSTER_NAME}

To create the Kubernetes cluster on AWS 

     kops update cluster --name ${KOPS_CLUSTER_NAME} --yes`

To validate cluster is running or not

     kops validate cluster
            
![alt text](https://s3.ap-south-1.amazonaws.com/qumuhyd1/kube_cluster.PNG)


Next step after setting up kops is setting up virtual-kubelet, its recently released by AWS and provides a methodology of running kubernetes in fargate. It requires 'go' language support. Becuase of limited support 'virtual-kubelet' provides i am still hovering around to intergate it with the terraform stack. 

 
