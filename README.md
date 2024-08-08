# AWSTerraform-Jenkins
This guide provides step-by-step instructions to deploy a Terraform template using a Jenkins pipeline on an AWS environment. It includes instructions for installing Jenkins on an Amazon Linux instance and setting up a Jenkins pipeline to automate the Terraform deployment.

##Install Jenkins & Git & Terraform on an Amazon Linux instance 

```sh
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo dnf install java-17-amazon-corretto -y   or sudo yum install java -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo yum install git
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform

##Once you installed jenkins use below command to view password. Save Password in your notepad

sudo cat /var/lib/jenkins/secrets/initialAdminPassword

##Login to jenkins , Create user, Install suggested plugins
  1. Connect to http://<your_server_public_DNS>:8080 from your browser. You will be able to access Jenkins through its management interface (Make sure allow port 8080 in your ec2 security group.)
  2. As prompted, enter the password. Which you saved in your notepad in above step.
  3. The Jenkins installation script directs you to the Customize Jenkins page. Click Install suggested plugins
  4. Once the installation is complete, the Create First Admin User will open. Enter your information, and then select Save and Continue.

Note -  you might see error "diskspace threshold" -->configure-->disk space monitoing threshold-->make it 0mb in all 

##Install Terraform plugin on jenkins
  1. Once the installation is complete and administrator login is enabled, click on “Manage Jenkins” in the left navigation menu
  2. Next, click on the “Manage Plugins” icon to install the Terraform plugin
  3. Click on the “Available plugins” tab in the left navigation menu, and enter “Terraform” in the search bar
  4. Mark the checkbox next to Terraform, and click on “Install without restart.”

##Create pipeline
  1. Navigate to “Dashboard” and click on “New Item”
  2. In the following screen, provide a valid name to the pipeline and select the “Pipeline” icon. Click on “OK” to save this pipeline
  3. Since our Terraform configuration resides on GitHub, select the “GitHub project” checkbox. You will also be asked for the project URL
     Example: https://github.com/santhoshchintala/AWSTerraform-Jenkins
  4. On left side click on pipeline . Add your script. Sample script added in below path
     [Pipelien Script]:https://github.com/santhoshchintala/AWSTerraform-Jenkins/blob/main/jenkinspipelinescript
  5. Replace your Github url and folder which is in github.

##Create IAM Role for access
    1.create ec2-admin - iam role and attach to ec2 instance
