# Devops-tech-test code is available in link: https://github.com/AishwaryaGilakara/Devops-tech-test
# Here I have used the trial version of the GCP , which comes with limit. As per the task requirements, I was unable to create 3 nodes as each node consumes 100GB. Therefore, I specified 2 nodes in the code. 

####    SYSTEM REQUIREMENTS ####

1. Runs on windows
2. GCP console link: https://console.cloud.google.com
3. VSCode
4. Terraform

####  In this project this terraform is doing mention activities  ####
## Task 1
1. Its creating private` K8s cluster on GKE
2. It should be creating a `new VPC`,with subnet will created in the london region with cluster CIDR ranges in the 'RFC1918 24-bit block'
3. Created two node-pools, one with 3 nodes without auto-scaling, another with 0 node by default with auto-scaling enabled. which is to use preemptible nodes4.
6. It Allows outbound internet access to the private cluster without assigning externalIP addresses to it
## Task 2
In the same Terraform working directory, code is generating below function:
1. Creating new big query dataset called vmo2_tech_test 
2. Creating a local module that assigns specific roles to specific datasets using google_bigquery_dataset_access resource and access those with my code.
3. All the supporting documents are under module directory.


## RUNNING DEVOPS-TECH-TEST

1. Download and unpack the Terraform package from the following link: https://github.com/AishwaryaGilakara/Devops-tech-test by pressing the green link: "Clone or download"
2. Open Gitbash in the desired directory where you want to clone the code locally. To clone the code, use the command "git clone git@github.com:AishwaryaGilakara/Devops-tech-test.git".
3. Open VSCode an Place the cloned Terraform folder in your working directory.
4. Open main.tf file, inside the file need to update the variables for project_id and credentials_file with your own values.
5. Example- Project_id="assesment-380119", credentials_file= "C:/Users/AISHWARYA/downloads/assesment-380119-51ff0c05ebf8.json"
6. Save the changes.
7. Note that you need to create project_id and credentials_file using the GCP console
8. Open the terminal 
9. Type the command "terraform apply -auto-approve"
10. This command will execute the program.
11. The script will run for a few minutes, You will know it is finished once the prompt shows the following colorful text: “Apply complete!”.
