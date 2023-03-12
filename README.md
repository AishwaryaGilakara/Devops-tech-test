# Devops-tech-test code is available in link: https://github.com/AishwaryaGilakara/Devops-tech-test
# Here used trial version of the GCP console,credit is 300GB as per task can't create 3 nodes, because 1 node consumes 100GB.So, mentioned 2 nodes in this code. 

#####   SYSTEM REQUIREMENTS     #####

# Runs on windows
# GCP console link: https://console.cloud.google.com
# VSCode
# Terraform

#####    RUNNING DEVOPS-TECH-TEST    #########

1. Download and unpack the Terraform package from the following link: https://github.com/AishwaryaGilakara/Devops-tech-test by pressing the green link: "Clone or download"
2. Open VSCode an Place the cloned Terraform folder in your working directory.
3. Open main.tf file, inside the file need to change the variables project_id and credentials_file
4. Example- Project_id="assesment-380119", credentials_file= "C:/Users/AISHWARYA/downloads/assesment-380119-51ff0c05ebf8.json"
5. Save the changes.
5. This project_id and credentials-file have to create using the GCP console
6. Open the terminal 
7. Type: terraform apply -auto-approve.
8. This command will execute the program.
9. The script will run for a few minutes, You will know it finished once the prompt shows the following colorful text: “Apply complete!”.
