# qumu_project
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

   a. Deploy using Dokcer
    
   CloudFormation script "cloud_formation_script.json" can be found under "Sentry_Docker_Stack" module.
    
   Summary - The CloudFormation scripts provisions infastructure, deploy and runs sentry application.
    
   Description - " The 'cloud_formation_script.json' to host sentry app. I am using my own hosted domain 'anmolposts.com' in Route53 to create a record set. The CloudFormation Template is AutoScalingMultiAZWithNotifications, creates a multi-az, load balanced and Auto Scaled sentry application running on ec2 instnace behind an application load balancer. The application is configured to span all Availability Zones in the region and is Auto-Scaled based on the CPU utilization of the web servers. Notifications will be sent to the operator email address on scaling events. The instances are load balanced with a simple health check against the default web page. Amazon Linux is chosen as the ami. Please proivde a public facing VPC and atleast two subnets(default) with internet access for application load balancer to function".

   Parameters:
   
             VPCId: Internet facing VPC
             Subnets: Two subnets
             InstanceType: Default (t2.large)
             OperatorEMail: Default (itsrai.anmol@gmail.com)
             KeyName: Your Regional key pair
             SSHLocation: Your Ip (Default: 0.0.0.0/0)
              
   **Note**: Sentry hardware requirements minimum 2 CPU, 4GB RAM.
       On using t2.micro the instarnce freezes on running dokcer web upgrade because of resource constraints.

   Recomended Instance type 
        - t2.xlarge 4 CPUS, 16GB RAM
   Minimum -
        -  t2.medium 2 CPUS, 4GB RAM
        
   AWS Architecture Diagram: https://s3.ap-south-1.amazonaws.com/qumuhyd1/CloudFormation_Docker_Architecture.png
   
   Sentry Home Page: https://s3.ap-south-1.amazonaws.com/qumuhyd1/sentry_home_page.PNG
   
   Creating user account is optional hence it is skipped in the script
       
       "yes n | sudo docker-compose run --rm web upgrade"
       
   Otherwise on user account creation, Sentry Welcome page - https://s3.ap-south-1.amazonaws.com/qumuhyd1/sentry_login_successful.PNG

       
  b. Deploy using Terraform and Kubernetes
  
  Find the terraform scripts in the terraform module.
    
   To initialize a working directory containing Terraform configuration files.
     
            terraform init
   
   To let terraform to create an execution plan.  
            
            terraform plan
            
   To apply the changes required to reach the desired state of the configuration
   
            terraform apply
        
        
   Description: The terraform module will deploy Containers on Amazon’s ECS using Fargate.
   
   
        
            
