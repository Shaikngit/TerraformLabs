# Azure Load balancer with Linux Apache as backendpool 
This TF Creates a Standard Load balancer and backend as Linux VM 
you just have to specify the number of instances you want to spin up in the backend pool

# Prerequisites
This code will work only from Linux machine or Bash on Windows with Terraform.exe running inside the bash or any sh *terminal

Because you would need SSH key pair for authentication

Make sure you have SSH Key pair generated for authentication in to Linux VM

id_rsa.pub and id_rsa are located under ~/.ssh/

[SSH Key Generator](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/mac-create-ssh-keys)






