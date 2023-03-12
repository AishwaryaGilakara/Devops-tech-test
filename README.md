# Devops-tech-test code is available in link: https://github.com/AishwaryaGilakara/Devops-tech-test
# Here I have used the trial version of the GCP , which came with a 250GB credit. As per the task requirements, I was unable to create 3 nodes as each node consumes 100GB. Therefore, I specified 2 nodes in the code. 

####    SYSTEM REQUIREMENTS ####

1. Runs on windows
2. GCP console link: https://console.cloud.google.com
3. VSCode
4. Terraform

#####    RUNNING DEVOPS-TECH-TEST    #########

1. Download and unpack the Terraform package from the following link: https://github.com/AishwaryaGilakara/Devops-tech-test by pressing the green link: "Clone or download"
##    How to clone code to local  ##
Open the Gitbash where you want to clone code in local, give this command "git clone git@github.com:AishwaryaGilakara/Devops-tech-test.git"
2. Open VSCode an Place the cloned Terraform folder in your working directory.
3. Open main.tf file, inside the file need to update the variables for project_id and credentials_file with your own values.
4. Example- Project_id="assesment-380119", credentials_file= "C:/Users/AISHWARYA/downloads/assesment-380119-51ff0c05ebf8.json"
5. Save the changes.
5. Note that you need to create project_id and credentials_file using the GCP console
6. Open the terminal 
7. Type the command "terraform apply -auto-approve"
8. This command will execute the program.
9. The script will run for a few minutes, You will know it is finished once the prompt shows the following colorful text: “Apply complete!”.
